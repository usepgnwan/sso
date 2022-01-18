<?php

use App\Http\Controllers\PostController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\RolePriviligeController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::resource('role', RoleController::class);
Route::resource('user', UserController::class);
Route::resource('privilige-management', RolePriviligeController::class);
Route::resource('post', PostController::class);
Route::delete('privilige-management/{id_role}/{id_privilige}', [RolePriviligeController::class, 'deletPrivilege'])->name('privilige_management.delete_rp');
