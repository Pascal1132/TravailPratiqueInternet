<?php

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

Route::get('/', function () {
    return redirect(Route('vueConnexion'));
});
//Pages de connexion
Route::get('/insc/', function (){
    return view('inscription');
})->name('vueInscription');
Route::get('/conn/', function (){
    return view('connexion');
})->name('vueConnexion');

//Validations de connexion
Route::post('/insc/', 'Auth\RegisterController@register')->name('inscription');
Route::post('/conn/', 'Auth\LoginController@login')->name('connexion');
Route::get('/decon/', 'Auth\LoginController@logout')->name('deconnexion');

Route::get('/home', 'UtilisateurController@index')->name('home');
Route::get('/comptes', 'UtilisateurController@listeComptes')->name('comptes');
Route::get('/compte', 'UtilisateurController@afficherCompte')->name('afficherCompte');