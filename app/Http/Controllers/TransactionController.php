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

class TransactionController extends Controller
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

    public function ajouter(Request $request)
    {
        if(Auth::user()->hasCompte($request->input('id'))){
            $compte = Compte::where('id', $request->input('id'))->first();
            $comptesDestination = Compte::where('id', '!=', $request->input('id'))->get();
            return view('Transaction.ajouter', ['compte'=>$compte, 'comptesDestination'=>$comptesDestination]);
        }else{
            return redirect(route('comptes'))->withErrors([__('app.bad_id')]);
        }


    }

    public function validationModifier(){
        return back()->withErrors(['msg'=>__('app.'.'updated') . ' !']);
    }
    public function validationAjouter(Request $request){

        return redirect(route('comptes'))->with(['succes'=>'success']);

    }

}
