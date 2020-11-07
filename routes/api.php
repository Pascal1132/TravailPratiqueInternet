<?php

use Illuminate\Http\Request;

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
Route::post('register', [RegisterController::class, 'register']);
Route::post('login', [RegisterController::class, 'login']);
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();

});
Route::prefix('api')->middleware('auth:api')->group( function () {
    Route::resource('comptes', \App\Http\Controllers\Api\CompteController::class);
    Route::get('comptes', \App\Http\Controllers\Api\CompteController::class.'@index');
});
