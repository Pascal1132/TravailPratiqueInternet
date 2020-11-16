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
        Route::post('/insc/', [\App\Http\Controllers\Auth\RegisterController::class, 'register'])->name('inscription');
        Route::post('/conn/', 'Auth\LoginController@login')->name('connexion');

    });
    Route::get('/decon/', 'Auth\LoginController@logout')->name('deconnexion');

    Route::get('/index', 'UtilisateurController@accueil')->name('utilisateur.accueil');

    Route::get('/compte/index', 'CompteController@index')->name('comptes');
    Route::get('/compte/afficher', 'CompteController@afficher')->name('afficherCompte');
    Route::get('/compte/ajouter', 'CompteController@ajouter')->name('nouveauCompte');
    Route::post('/compte/ajouter', 'CompteController@validationAjouter')->name('ajouterCompte');
    Route::get('/compte/modifier', 'CompteController@modifier')->name('compte.modifier');
    Route::post('/compte/modifier', 'CompteController@validationModifier')->name('compte.modifier');
    Route::get('/compte/supprimer', 'CompteController@supprimer')->name('compte.supprimer');
    Route::get('/comptes', 'CompteController@adminIndex')->name('admin.comptes');

    Route::get('/transaction/ajouter', 'TransactionController@ajouter')->name('ajouterTransaction');
    Route::get('/admin/transaction/ajouter/', 'TransactionController@ajouterAdmin')->name('admin.transaction.ajouter');
    Route::post('/admin/transaction/ajouter/', 'TransactionController@validerAjouterAdmin')->name('transaction.ajouter.admin');
    Route::post('/transaction/ajouter', 'TransactionController@validationAjouter')->name('validationAjouterTransaction');
    Route::get('/transaction/index', 'TransactionController@index')->name('transaction.index');
    Route::get('/transaction/modifier', 'TransactionController@modifier')->name('transaction.modifier');
    Route::post('/transaction/modifier', 'TransactionController@validerModifier')->name('transaction.modifier');
    Route::get('/transaction/supprimer', 'TransactionController@supprimer')->name('transaction.supprimer');

    Route::get('/modifier', 'UtilisateurController@modifier')->name('modifier');
    Route::get('/utilisateur/supprimer', 'UtilisateurController@supprimer')->name('utilisateur.supprimer');
    Route::post('/val/mod/util', 'UtilisateurController@validationModifier')->name('valModifierUtilisateur');
//Changement de langue
    Route::get('/chgLang', 'LangueController@chgLang')->name('changer_langue');

//Admin
    Route::get('/utilisateurs/index', 'UtilisateurController@index')->name('utilisateur.index');

    Route::get('/confirmer', 'UtilisateurController@confirmer')->name('utilisateur.confirmer');
    Route::get('/envoiCourrielConfirmation', 'UtilisateurController@envoiCourrielConfirmation')->name('envoiCourrielConfirmation');
    Route::post('/envoiCourrielCommentaires', 'CommentaireController@index')->name('commentaire');
    Route::get("/apropos", function(){
       return View("apropos");
    })->name("apropos");

    Route::prefix('api')->group(function(){
        Route::post('getCompteByUtilisateur', 'CompteController@getCompteByUtilisateur');
        Route::get('autocomplete_nomCompte', 'CompteController@autocompleteNomCompte');
    });
    Route::prefix('admin')->group(function () {
        
    });
});
