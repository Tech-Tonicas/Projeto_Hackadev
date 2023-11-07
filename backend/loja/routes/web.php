<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

use App\Http\Controllers\Productscontroller;

/* Route::get('/', function () {
    return view('welcome');
}); */

// rota utilizada no controller
Route::get('/products/form', [Productscontroller::class, 'form']);// form é o metodo para formulário
Route::get('/products/front', [ProductsController::class, 'front']);//front- view front-product

