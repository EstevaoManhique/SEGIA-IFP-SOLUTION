<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\ServiceController;
use App\Http\Controllers\ShopController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\InnstituitionController;
use App\Http\Controllers\SocialMediaController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/* Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
}); */

Route::post('login', [AuthController::class, 'login'])->name('login');
Route::get('user', [AuthController::class, 'user'])->middleware('auth:api');
Route::post('register', [AuthController::class, 'register']);
Route::post('forgot', [AuthController::class, 'forgot']);
Route::post('reset', [AuthController::class, 'reset']);


Route::get('/products', [ProductController::class, 'index']);
Route::prefix('/product')->group(function () {
    Route::post('/store', [ProductController::class, 'store'])->name('product.store');
    Route::put('/{id}', [ProductController::class, 'update'])->name('product.update');
    Route::delete('/{id}', [ProductController::class, 'destroy'])->name('product.destroy');
    Route::get('/{id}', [ProductController::class, 'show'])->name('product.show');
});

Route::get('/services', [ServiceController::class, 'index']);
Route::prefix('/service')->group(function () {
    Route::post('/store', [ServiceController::class, 'store'])->name('service.store');
    Route::put('/{id}', [ServiceController::class, 'update'])->name('service.update');
    Route::delete('/{id}', [ServiceController::class, 'destroy'])->name('service.destroy');
    Route::get('/{id}', [ServiceController::class, 'show'])->name('service.show');
});

Route::get('/posts', [PostController::class, 'index']);
Route::prefix('/post')->group(function () {
    Route::post('/store', [PostController::class, 'store'])->name('post.store');
    Route::put('/{id}', [PostController::class, 'update'])->name('post.update');
    Route::delete('/{id}', [PostController::class, 'destroy'])->name('post.destroy');
    Route::get('/{id}', [PostController::class, 'show'])->name('post.show');
});

Route::get('/shops', [ShopController::class, 'index']);
Route::prefix('/shop')->group(function () {
    Route::post('/store', [ShopController::class, 'store'])->name('shop.store');
    Route::put('/{id}', [ShopController::class, 'update'])->name('shop.update');
    Route::delete('/{id}', [ShopController::class, 'destroy'])->name('shop.destroy');
    Route::get('/{id}', [ShopController::class, 'show'])->name('shop.show');
});

Route::get('/instituions', [InstituionController::class, 'index']);
Route::prefix('/instituion')->group(function () {
    Route::post('/store', [InstituionController::class, 'store'])->name('instituion.store');
    Route::put('/{id}', [InstituionController::class, 'update'])->name('instituion.update');
    Route::delete('/{id}', [InstituionController::class, 'destroy'])->name('instituion.destroy');
    Route::get('/{id}', [InstituionController::class, 'show'])->name('instituion.show');
});

Route::get('/socialmedia', [SocialMediaController::class, 'index']);
Route::prefix('/socialmedia')->group(function () {
    Route::post('/store', [SocialMediaController::class, 'store'])->name('socialmedia.store');
    Route::put('/{id}', [SocialMediaController::class, 'update'])->name('socialmedia.update');
    Route::delete('/{id}', [SocialMediaController::class, 'destroy'])->name('socialmedia.destroy');
    Route::get('/{id}', [SocialMediaController::class, 'show'])->name('socialmedia.show');
});