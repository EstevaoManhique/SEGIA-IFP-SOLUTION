<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SchoolController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\TeacherController;
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
Route::get('users', [AuthController::class, 'users'])->name('users');


Route::controller(SchoolController::class)->prefix('school')->group(function () {
    Route::get('/', 'index')->name('school.index');
    Route::post('/store', 'store')->name('school.store');
    Route::get('/{id}', 'show')->name('school.show');
    Route::delete('/{id}', 'destroy')->name('school.destroy');
    Route::put('/{id}', 'update')->name('school.update');
});

Route::controller(StudentController::class)->prefix('student')->group(function () {
    Route::get('/', 'index')->name('student.index');
    Route::post('/store', 'store')->name('student.store');
    Route::get('/{id}', 'show')->name('student.show');
    Route::delete('/{id}', 'destroy')->name('student.destroy');
    Route::put('/{id}', 'update')->name('student.update');
});

Route::controller(TeacherController::class)->prefix('teacher')->group(function () {
    Route::get('/', 'index')->name('teacher.index');
    Route::post('/store', 'store')->name('teacher.store');
    Route::get('/{id}', 'show')->name('teacher.show');
    Route::delete('/{id}', 'destroy')->name('teacher.destroy');
    Route::put('/{id}', 'update')->name('teacher.update');
});