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

Route::group(['middleware'=>'all'], function (){
    Route::group(['middleware'=>'redirectIfAuthenticated'], function () {
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

    });
    Route::get('/decon/', 'Auth\LoginController@logout')->name('deconnexion');

    Route::get('/index', 'UtilisateurController@index')->name('utilisateur.index');

    Route::get('/compte/index', 'CompteController@index')->name('comptes');
    Route::get('/compte/afficher', 'CompteController@afficher')->name('afficherCompte');
    Route::get('/compte/ajouter', 'CompteController@ajouter')->name('nouveauCompte');
    Route::post('/compte/ajouter', 'CompteController@validationAjouter')->name('ajouterCompte');

    Route::get('/transaction/ajouter', 'TransactionController@ajouter')->name('ajouterTransaction');

    Route::get('/modifier', 'UtilisateurController@modifier')->name('modifier');
    Route::post('/val/mod/util', 'UtilisateurController@validationMoifier')->name('valModifierUtilisateur');
//Changement de langue
    Route::get('/chgLang', 'Controller@chgLang')->name('changer_langue');

//Admin
    Route::get('/utilisateurs', 'UtilisateurController@listeUtilisateurs')->name('listeUtilisateurs');
});
