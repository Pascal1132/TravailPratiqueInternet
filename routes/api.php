<?php

use App\Models\Compte;
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


Route::resource('comptes', 'Api\CompteController');
Route::resource('types_compte', 'Api\RefTypeCompteController');
Route::resource('utilisateurs', 'Api\UtilisateurController');
Route::get('routeur/{nom}', function($nom){
   return response()->json(route($nom));
});


