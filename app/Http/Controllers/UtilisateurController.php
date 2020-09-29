<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

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
        return view('Utilisateur.home');
    }

    public function listeComptes()
    {
        return view('Utilisateur.comptes');
    }
    public function afficherCompte()
    {
        return view('Utilisateur.compte');
    }
}
