<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

use App\Http\Controllers\Productscontroller;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// criar os produtos Localhost:8000/api/products
//essa rota post é chamada na view
Route::post('/products', [Productscontroller::class, 'create']);//create:metodo,coloca o nome que quiser/é usado no controller
Route::get('/products/{id}', [Productscontroller::class, 'getProduct']);//pega produto por id
Route::get('/products', [Productscontroller::class, 'getAll']);//pega produto filtra produto por categorias e nome
Route::put('/products/{id}', [ProductsController::class, 'update']);//alterar produto


//upload das imagens
Route::post('/products/urlImagem', [Productscontroller::class, 'uploadUrlImagem']);// uploadProfile é o metodo ,vc coloca o nome que quiser
