<?php
//backend mobile
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\Storage;

class Productscontroller extends Controller
{
    //metodo form que foi passado na routes/web.php
    public function form()
    {
        return view('cadastra_produto');
    }

    public function front()
    {
        return view('front_products');
    }

//metodo que faz o cadastro foi passado na routes/web.php
    public function create(Request $request) //cria/pegar os dados vindo do formulário
    {
        $product = new Product($request->all());//intancia, carregar o model, cria todos os  objeto
      
       if ($product->save() === true){//verifica se conseguiu salvar no banco de dados
    
        return response()->json($product,201);//retorna o objeto com id
       }
       return response()->json(["error" => "Erro ao cadastrar"], 400);
    }

  
    
      //metodo que pega o produto por id
    public function getProduct(int $id)
    {
        $product = Product::find($id);//carrega o produto
        //devolve o produto
        return response()->json($product);//pega um produto do banco de dados
    }
    

      //metodo que filtra o produto por categorias
     public function getAll(Request $request)
     {
       // se tem: ?category=valor
       $categorias = $request->input('categorias');

       // se tem: ?name=valor
       $nome = $request->input('nome');

       if ($categorias) {
           $products = Product::where('categorias', $categorias)->get();
       } elseif ($nome) {
           $products = Product::where('nome', $nome)->get();
       } else {
           $products = Product::all();
       }

       return response()->json($products);//pega um produto do banco de dados
     } 

  //pega produtos por nome, etc
  public function getSearch(Request $request)
  {
      // se tem: ?category=valor
      $nome = $request->input('nome');
  
      // se tem: ?name=valor
      $descricao = $request->input('descricao');
  
      if ($nome) {
          $products = Product::where('nome', 'like', "%$nome%")->get();
      } elseif ($descricao) {
          $products = Product::where('descricao', 'like', "%$descricao%")->get();
      } else {
          $products = Product::all();
      }
  
      return response()->json($products);
  }
  

     public function update(int $id, Request $request)
     {
         // Conceito do PUT em Rest, é subistituir
         $product = Product::findOrFail($id);
 
         // Estamos preenchendo o que veio da request
         // no produtos que selecionamos pelo ID
         $product->fill($request->all());
 
         if ($product->save()) {
             return response()->json($product, 202);
         }
         return response('Erro ao atualizar', 400);
     }

//deletar produto
public function delete(int $id)
    {
        $produto = Product::findOrFail($id);
        if ($produto->delete()) {
            return response()->json([
                'id' => $produto->id,
                'mensagem' => 'Produto excluido com sucesso'
            ], 202);
        }
        return response('Erro ao excluir', 400);
    }

//upload de imagens
public function uploadUrlImagem(Request $request)
    {
        // Para encontrar a imagem, rodar:
        // php artisan storage:link

        // se há um arquivo no campo "urlImagem"
        if ($request->hasFile('urlImagem')) {
            // .png | .jpg | .jpeg 
            $extensao = $request->file('urlImagem')->extension();
            
            // storePubliclyAs armazena o arquivo temporario na pasta informada
            // na área pública: pasta "public" do projeto
            $nomeArquivo = uniqid();
            $path = $request->file('urlImagem')->storePubliclyAs('public/products', "$nomeArquivo." . $extensao);

            // respondemos com um link
            return response()->json([
                'url' => Storage::url($path)
            ]);
        }

        return response('Erro ao salvar a imagem', 400);
    }

} 
