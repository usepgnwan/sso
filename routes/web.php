<?php

use App\Http\Controllers\PrivilegeController;
use App\Http\Controllers\RoleController;
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

Route::get('/', [RoleController::class, 'index']);

Route::prefix('dashboard')->group(function () {
    Route::get('role', [RoleController::class, 'index'])->name('dashboard.role');
    Route::get('privilege', [PrivilegeController::class, 'index'])->name('dashboard.privilege');
    Route::get('user', [UserController::class, 'index'])->name('dashboard.user');
});
