<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SchoolController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\TeacherController;
use App\Http\Controllers\GeneralController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\PersonController;
use App\Http\Controllers\ClasseController;
use App\Http\Controllers\IfpCalendarioExameController;
use App\Http\Controllers\SubjectController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProvinceControler;
use App\Http\Controllers\DistrictController;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\CandidateController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\SalaController;
use App\Http\Controllers\JuryController;
use App\Http\Controllers\ExamController;
use App\Http\Controllers\QuestaoController;
use App\Http\Controllers\AvaliacaoController;


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
Route::put('user/{id}', [AuthController::class, 'update'])->name('user.update');
Route::delete('user/{id}', [AuthController::class, 'destroy'])->name('user.destroy');


Route::controller(SchoolController::class)->prefix('school')->group(function () {
    Route::get('/', 'index')->name('school.index');
    Route::get('/centers', 'centers')->name('centers.index');
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

Route::controller(PersonController::class)->prefix('person')->group(function () {
    Route::get('/', 'index')->name('person.index');
    Route::post('/store', 'store')->name('person.store');
    Route::get('/{id}', 'show')->name('person.show');
    Route::delete('/{id}', 'destroy')->name('person.destroy');
    Route::put('/{id}', 'update')->name('person.update');
});

Route::controller(GeneralController::class)->prefix('config')->group(function () {
    Route::get('/nationality', 'nationalities')->name('config.nationality');
    Route::get('/provinces', 'provinces')->name('config.provinces');
});

Route::controller(IfpCalendarioExameController::class)->prefix('ifpcalendar')->group(function () {
    Route::get('/', 'index')->name('ifpcalendario.index');
    Route::post('/store', 'store')->name('ifpcalendario.store');
    Route::get('/{id}', 'show')->name('ifpcalendario.show');
    Route::delete('/{id}', 'destroy')->name('ifpcalendario.destroy');
    Route::put('/{id}', 'update')->name('ifpcalendario.update');
});

Route::controller(ClasseController::class)->prefix('classe')->group(function () {
    Route::get('/', 'index')->name('person.index');
    Route::post('/store', 'store')->name('person.store');
    Route::get('/{id}', 'show')->name('person.show');
    Route::delete('/{id}', 'destroy')->name('person.destroy');
    Route::put('/{id}', 'update')->name('person.update');
});

Route::controller(SubjectController::class)->prefix('subject')->group(function () {
    Route::get('/', 'index')->name('person.index');
    Route::post('/store', 'store')->name('person.store');
    Route::get('/{id}', 'show')->name('person.show');
    Route::delete('/{id}', 'destroy')->name('person.destroy');
    Route::put('/{id}', 'update')->name('person.update');
});

Route::controller(CategoryController::class)->prefix('category')->group(function () {
    Route::get('/', 'index')->name('catgory.index');
    Route::post('/store', 'store')->name('catgory.store');
    Route::get('/{id}', 'show')->name('catgory.show');
    Route::delete('/{id}', 'destroy')->name('catgory.destroy');
    Route::put('/{id}', 'update')->name('catgory.update');
});

Route::controller(ProvinceControler::class)->prefix('province')->group(function () {
    Route::get('/', 'index')->name('province.index');
    Route::post('/store', 'store')->name('province.store');
    Route::get('/{id}', 'show')->name('province.show');
    Route::delete('/{id}', 'destroy')->name('province.destroy');
    Route::put('/{id}', 'update')->name('province.update');
});


Route::controller(DistrictController::class)->prefix('district')->group(function () {
    Route::get('/', 'index')->name('district.index');
    Route::post('/store', 'store')->name('district.store');
    Route::get('/{id}', 'show')->name('district.show');
    Route::delete('/{id}', 'destroy')->name('district.destroy');
    Route::put('/{id}', 'update')->name('district.update');
});

Route::controller(CourseController::class)->prefix('course')->group(function () {
    Route::get('/', 'index')->name('course.index');
    Route::post('/store', 'store')->name('course.store');
    Route::get('/{id}', 'show')->name('course.show');
    Route::delete('/{id}', 'destroy')->name('course.destroy');
    Route::put('/{id}', 'update')->name('course.update');
});

Route::controller(CandidateController::class)->prefix('candidate')->group(function () {
    Route::get('/', 'index')->name('candidate.index');
    Route::get('/byschool/{id}', 'byschool')->name('candidate.byschool');
    Route::get('/bycourse/{id}', 'bycourse')->name('candidate.bycourse');
    Route::get('/byjury/{id}', 'byjury')->name('candidate.byjury');    
    Route::post('/store', 'store')->name('candidate.store');
    Route::post('/storemany', 'storeMany')->name('candidate.storemany');
    Route::post('/createjury', 'createjury')->name('candidate.createjury');
    Route::get('/{id}', 'show')->name('candidate.show');
    Route::delete('/{id}', 'destroy')->name('candidate.destroy');
    Route::put('/{id}', 'update')->name('candidate.update');
});

Route::controller(ContactController::class)->prefix('contact')->group(function () {
    Route::get('/', 'index')->name('contact.index');
    Route::post('/store', 'store')->name('contact.store');
    Route::get('/{id}', 'show')->name('contact.show');
    Route::delete('/{id}', 'destroy')->name('contact.destroy');
    Route::put('/{id}', 'update')->name('contact.update');
});

Route::controller(SalaController::class)->prefix('sala')->group(function () {
    Route::get('/', 'index')->name('sala.index');
    Route::post('/store', 'store')->name('sala.store');
    Route::get('/{id}', 'show')->name('sala.show');
    Route::delete('/{id}', 'destroy')->name('sala.destroy');
    Route::put('/{id}', 'update')->name('sala.update');
});

Route::controller(JuryController::class)->prefix('jury')->group(function () {
    Route::get('/', 'index')->name('jury.index');
    Route::get('/jurysBySchool/{id}', 'jurysBySchool')->name('jurysBySchool.index');
    Route::post('/store', 'store')->name('jury.store');
    Route::get('/{id}', 'show')->name('jury.show');
    Route::delete('/{id}', 'destroy')->name('jury.destroy');
    Route::put('/{id}', 'update')->name('jury.update');
});

Route::controller(ExamController::class)->prefix('exam')->group(function () {
    Route::get('/', 'index')->name('exam.index');
    Route::post('/store', 'store')->name('exam.store');
    Route::get('/{id}', 'show')->name('exam.show');
    Route::delete('/{id}', 'destroy')->name('exam.destroy');
    Route::put('/{id}', 'update')->name('exam.update');
});

Route::controller(QuestaoController::class)->prefix('question')->group(function () {
    Route::get('/', 'index')->name('question.index');
    Route::post('/store', 'store')->name('question.store');
    Route::get('/questionsByExam/{id}', 'questionsByExam')->name('question.show');
    Route::get('/{id}', 'show')->name('question.show');
    Route::delete('/{id}', 'destroy')->name('question.destroy');
    Route::put('/{id}', 'update')->name('question.update');
});

Route::controller(AvaliacaoController::class)->prefix('avaliation')->group(function () {
    Route::get('/', 'index')->name('avaliation.index');
    Route::post('/store', 'store')->name('avaliation.store');
    Route::post('/storeMany', 'storeMany')->name('avaliation.storeMany');
    Route::post('/createjury', 'createjury')->name('avaliation.createjury');
    Route::get('/avaliationsByExam/{id}', 'avaliationsByExam')->name('avaliation.show');
    Route::get('/bySchool/{id}', 'bySchool')->name('avaliation.bySchool');
    Route::get('/pauta/{id}', 'pauta')->name('avaliation.pauta');
    Route::get('/byjury/{id}', 'byjury')->name('avaliation.byjury');
    Route::get('/bycourse/{id}', 'bycourse')->name('avaliation.bycourse');
    Route::get('/{id}', 'show')->name('avaliation.show');
    Route::delete('/{id}', 'destroy')->name('avaliation.destroy');
    Route::put('/{id}', 'update')->name('avaliation.update');
});