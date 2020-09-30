<?php

namespace App\Http\Controllers;

use App\Models\Utilisateur;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class UtilisateurController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('Utilisateur.index');
    }

    public function listeComptes()
    {
        return view('Utilisateur.comptes');
    }
    public function afficherCompte()
    {
        return view('Utilisateur.compte');
    }
    public function listeUtilisateurs(){
        if(Gate::denies('afficher-utilisateurs')){
            return redirect('home');
        }

        return view('Utilisateur.utilisateurs', ['utilisateurs'=>Utilisateur::all()]);
    }
}
