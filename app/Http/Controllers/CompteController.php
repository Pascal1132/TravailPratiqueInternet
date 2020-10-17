<?php

namespace App\Http\Controllers;

use App\Models\Compte;
use App\Models\RefRoleUtilisateur;
use App\Models\RefTypeCompte;
use App\Models\Utilisateur;
use Hamcrest\Util;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Illuminate\View\View;

class CompteController extends Controller
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
        return view('Compte.index');
    }
    public function afficher(Request $request)
    {
        $compte = Compte::where('id',$request->input('id'))->where('utilisateur_id', Auth::user()->id)->first();
        if(empty($compte))return redirect(route('comptes'))->withErrors([__('app.bad_id')]);
        return view('Compte.afficher', ['compte'=> $compte]);
    }
    public function ajouter()
    {
        $typesCompte =  RefTypeCompte::all();
        return view('Compte.ajouter', ['typesCompte'=>$typesCompte]);
    }


    public function validationAjouter(Request $request){
        $typeCompte =  RefTypeCompte::where('id',$request->input('type'))->firstOrFail();
        $nomType = $typeCompte->type;
        $nbCompteType = Auth::user()->comptes->where('type_compte_id', $request->input('type'))->count();
        if( empty($request->input('nom'))) {
            $nomCompte = $nomType . " " . $nbCompteType;
        }else {
            $nomCompte = $request->input('nom');
        }
        $compte = Compte::create([
            'type_compte_id'=> $request->input('type'),
            'utilisateur_id'=> Auth::user()->id,
            'nom'=>$nomCompte,
        ]);
        return redirect(route('comptes'))->withMessages(['msg'=>'success']);

    }
    public function modifier(Request $request){
        $typesCompte =  RefTypeCompte::all();
        if(!Auth::user()->hasCompte($request->input('id')))return redirect(route('comptes'))->withErrors([__('app.bad_id')]);
        $compte = Compte::find($request->input('id'))->first();
        return view('Compte.modifier',['compte'=>$compte, 'typesCompte'=>$typesCompte]);
    }
    public function validationModifier(Request $request){
        $id = $request->input('id');
        if(!Auth::user()->hasCompte($id))return redirect(route('comptes'))->withErrors([__('app.bad_id')]);
        $typeCompte =  RefTypeCompte::where('id',$request->input('type'))->firstOrFail();
        $nomType = $typeCompte->type;


        if( empty($request->input('nom'))) {
            $nomCompte = $nomType . " " . $id;
        }else {
            $nomCompte = $request->input('nom');
        }
        $compte = Compte::find($id)->first();
        $compte->type_compte_id = $typeCompte->id;
        $compte->nom = $nomCompte;
        $compte->save();
        return back()->with('succes',__('app.'.'updated') . ' !');
    }

}
