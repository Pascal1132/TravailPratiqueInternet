<?php

namespace App\Http\Controllers;

use App\Models\Compte;
use App\Models\RefRoleUtilisateur;
use App\Models\RefTypeCompte;
use App\Models\RefTypeTransaction;
use App\Models\Transaction;
use App\Models\Utilisateur;
use Hamcrest\Util;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Illuminate\Validation\Validator;

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

        if(Auth::user()->hasCompte($request->input('compte_id'))){
            switch ($request->input('type_operation')){
                case 'depot_cheque':

                    $this->ajouterDepotCheque($request);
                    break;
                case 'virement_entre_comptes':
                    //$this->ajouterVirementCompte();
                    break;
            }
        }else{
            return back()->withErrors(['msg'=>__('app.unauthorized').' !']);
        }


    }
    public function ajouterDepotCheque($req){
        $typeTransaction = "Dépot";
        $typeTransactionId = (RefTypeTransaction::getIdFromType($typeTransaction)->first())->id;
        $validatedData = $req->validate([
            'image_cheque' => 'mimes:jpeg,jpg,png,gif|max:100000',
            'montant' => 'required|numeric',
            'description'=> 'required|string',
        ]);
        $transaction = Transaction::create([
            'compte_id'=>$req->input('compte_id'),
            'type_transaction_id'=>$typeTransactionId,
            'description'=>$validatedData['description'],
            'montant'=>$validatedData['montant']

        ]);
        $req->file('image_cheque')->storeAs('cheques', $transaction->id.".".$req->file('image_cheque')->extension());
    }
    public function ajouterVirementCompte(){

    }


}
