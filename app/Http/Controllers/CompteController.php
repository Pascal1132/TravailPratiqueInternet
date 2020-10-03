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
    public function afficher()
    {
        return view('Compte.modifier');
    }
    public function ajouter()
    {
        $typesCompte =  RefTypeCompte::all();
        return view('Compte.ajouter', ['typesCompte'=>$typesCompte]);
    }

    public function validationModifier(){
        return back()->withErrors(['msg'=>__('app.'.'updated') . ' !']);
    }
    public function validationAjouter(Request $request){
        $typeCompte =  RefTypeCompte::where('id',$request->input('type'))->first();
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

}
