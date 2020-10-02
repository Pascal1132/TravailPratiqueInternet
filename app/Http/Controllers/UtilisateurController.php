<?php

namespace App\Http\Controllers;

use App\Models\RefRoleUtilisateur;
use App\Models\Utilisateur;
use Hamcrest\Util;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
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
        return view('Compte.index');
    }
    public function afficherCompte()
    {
        return view('Compte.modifier');
    }
    public function listeUtilisateurs(){
        if(Gate::denies('afficher-utilisateurs')){
            return redirect('home');
        }

        return view('Utilisateur.liste', ['utilisateurs'=>Utilisateur::all()]);
    }
    public function modifier(Request $request){
        $id = $request->get('id');
        $listeRoles = RefRoleUtilisateur::all();

        if(Gate::denies('modifier-utilisateurs') || !$request->has('id')){

            $id = Auth::user()->id;
        }
        $utilisateur = Utilisateur::where('id',$id)->first();

        return view('Utilisateur.modifier', ['utilisateur'=>$utilisateur, 'listeRoles'=>$listeRoles]);
    }
    public function validationModifier(){
        return back()->withErrors(['msg'=>__('app.'.'updated') . ' !']);
    }

}
