<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

// procura por uma tabela chamada: products
class Product extends Model
{
    // quando o nome da tabela é diferente
    // configuração de nome de tabela
    // protected $table = 'tbl_products';

    use HasFactory;
    
    // São os campos da tabela
    // que podem ser armazenados diretamente
    // no (construtor) model
//atributo protegido para os campos que serão prenchidos
    protected $fillable = [
        'nome', 
        'fabricante', 
        'resumo', 
        'preco', 
        'urlImagem', 
        'categorias', 
        'cor', 
        'descricao'
    ];

    // Vamos criar um mutator para alterar a URL quando
    // for solicitada
    public function urlImagem(): Attribute
    {
        return Attribute::make(
            get: fn(string $value) => url($value)
        );
    }

}
