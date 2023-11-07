import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Produto {
  int? id;
  String? fabricante;
  String? nome;
  String? resumo;
  double? preco;
  String? urlImagem;
  String? categorias;
  String? cor;
  String? descricao;
}

void main() {
  runApp(const Cadastro());
}

class Cadastro extends StatelessWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 40, 40, 40),
        ),
      ),
      home: const CadastrarProdutos(),
    );
  }
}

class CadastrarProdutos extends StatefulWidget {
  const CadastrarProdutos({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ConteudoPagina();
  }
}

List<String> categoriasDisponiveis = ['Fone', 'Mouse', 'Teclado', 'Monitor'];

Future<void> cadastrarProdutos(
  String fabricante,
  String nome,
  String resumo,
  double preco,
  String urlImagem,
  String categorias,
  String cor,
  String descricao,
) async {
  await http.post(Uri.parse('http://localhost:8080/products'),
      headers: <String, String>{'Content-type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        "fabricante": fabricante,
        "nome": nome,
        "resumo": resumo,
        "preco": preco,
        "urlImagem": urlImagem,
        "categorias": categorias,
        "cor": cor,
        "descricao": descricao,
      }));
}

Future<List<Produto>> selecionarProdutos() async {
  var retorno = await http.get(Uri.parse('http://localhost:8080/products'));
  var dados = jsonDecode(retorno.body);
  List<Produto> produtos = [];
  for (var obj in dados) {
    Produto produto = Produto();
    produto.id = obj["id"];
    produto.fabricante = obj["fabricante"];
    produto.nome = obj["nome"];
    produto.resumo = obj["resumo"];
    produto.preco = obj["preco"];
    produto.urlImagem = obj["urlImagem"];
    produto.categorias = obj["categorias"];
    produto.cor = obj["cor"];
    produto.descricao = obj["descricao"];

    produtos.add(produto);
  }
  return produtos;
}

class ConteudoPagina extends State {
  String? fabricante;
  String? nome;
  String? resumo;
  double? preco;
  String? urlImagem;
  String? categorias;
  String? cor;
  String? descricao;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 67, 65, 65),
        title: const Text("Cadastro de Produtos"),
      ),
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 300,
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Digite nome do fabricante',
                      ),
                      onChanged: (valor) {
                        setState(() {
                          fabricante = valor;
                        });
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Digite nome do produto',
                      ),
                      onChanged: (valor) {
                        setState(() {
                          nome = valor;
                        });
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Digite resumo breve do produto',
                      ),
                      onChanged: (valor) {
                        setState(() {
                          resumo = valor;
                        });
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Digite o preço',
                      ),
                      onChanged: (valor) {
                        setState(() {
                          preco = double.tryParse(valor);
                        });
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Digite o endereço da imagem',
                      ),
                      onChanged: (valor) {
                        setState(() {
                          urlImagem = valor;
                        });
                      },
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: 'Selecione a categoria',
                      ),
                      value: categorias,
                      items: categoriasDisponiveis.map((categoria) {
                        return DropdownMenuItem<String>(
                          value: categoria,
                          child: Text(categoria),
                        );
                      }).toList(),
                      onChanged: (valor) {
                        setState(() {
                          categorias = valor;
                        });
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Digite cor do produto',
                      ),
                      onChanged: (valor) {
                        setState(() {
                          cor = valor;
                        });
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Digite descrição do produto',
                      ),
                      onChanged: (valor) {
                        setState(() {
                          descricao = valor;
                        });
                      },
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          cadastrarProdutos(
                            fabricante!,
                            nome!,
                            resumo!,
                            preco!,
                            urlImagem!,
                            categorias!,
                            cor!,
                            descricao!,
                          );

                          // Mostrar um SnackBar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Produto adicionado'),
                            ),
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 67, 65, 65),
                        backgroundColor: const  Color(0xFF52E636),
                        fixedSize: const Size(210, 40),
                      ),
                      child: const Text(
                        "Cadastrar Produto",
                        style: TextStyle(color: Color.fromARGB(255, 246, 247, 246)),
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}