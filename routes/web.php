<?php

use App\Http\Controllers\DasboardController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\MenuController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\PrivilegeController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\RolePriviligeController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [PostController::class, 'blog'])->name('default');
Route::get('blog/{post:slug}', [PostController::class, 'detail'])->name('blog');
Route::post('post/tambah', [PostController::class, 'store'])->name('post.tambah');


Route::prefix('dashboard')->group(function () {
    Route::get('/', [DasboardController::class, 'parent'])->name('parent')->middleware('auth');
    Route::get('/index/{id?}', [DasboardController::class, 'index'])->name('dashboard')->middleware('auth');
    Route::get('/blog/{opt?}', [PostController::class, 'index'])->name('dashboard.blog')->middleware('auth');
    Route::middleware('auth', 'role:admin')->group(function () {
        Route::get('/blog/publish', [PostController::class, 'publish_post'])->name('dashboard.blog.publish');
        Route::get('role/{opt?}', [RoleController::class, 'index'])->name('dashboard.role');
        Route::get('privilege/{opt?}', [PrivilegeController::class, 'index'])->name('dashboard.privilege');
        Route::get('user', [UserController::class, 'index'])->name('dashboard.user');
        Route::get('privilige-management/{opt?}', [RolePriviligeController::class, 'index'])->name('dashboard.roleprivilige');
        Route::get('menu', [MenuController::class, 'index'])->name('dashboard.menu');
        Route::get('list_menu/{id}', [MenuController::class, 'list_menu'])->name('dashboard.list_menu');
        Route::post('save_menu', [MenuController::class, 'save'])->name('dashboard.save_menu');
    });
});

Route::prefix('auth')->group(function () {
    Route::get('login', [LoginController::class, 'index'])->name('login')->middleware('guest');
    Route::post('login', [LoginController::class, 'authenticate'])->name('login');
    Route::post('logout', [LoginController::class, 'logout'])->name('logout');
});
