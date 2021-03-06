<?php

namespace App\Http\Controllers;

use App\Models\Compte;
use App\Models\Image;
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
        if(Gate::denies('gerer-toutes-transactions')){
            return redirect(route('utilisateur.index'))->withErrors([__('app.unauthorized')]);
        }
        $transactions = Transaction::all();

        return view('Transaction.index', ['transactions'=>$transactions]);
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
                    $this->ajouterVirementCompte($request);
                    break;
            }
            return redirect(route('comptes'));
        }else{
            return back()->withErrors(['msg'=>__('app.unauthorized').' !']);
        }


    }
    public function ajouterDepotCheque($req){
        $typeTransaction = "check_deposit";
        $typeTransactionId = (RefTypeTransaction::getIdFromType($typeTransaction))->id;
        $validatedData = $req->validate([
            'image_cheque' => 'required|string',
            'montant' => 'required|numeric',
            'description'=> 'required|string',
        ]);
        $transaction = Transaction::create([
            'compte_id'=>$req->input('compte_id'),
            'type_transaction_id'=>$typeTransactionId,
            'description'=>$validatedData['description'],
            'montant'=>$validatedData['montant']

        ]);
        $image = Image::create([
            'transaction_id'=>$transaction->id,
            'fichier'=>$validatedData['image_cheque'],
        ]);
        $image->save();
    }
    public function ajouterVirementCompte($req){


        $typeTransactionProvenance = (RefTypeTransaction::getIdFromType("withdrawal")->first())->id;
        $typeTransactionDestination = (RefTypeTransaction::getIdFromType("deposit")->first())->id;
        if(Auth::user()->hasCompte($req->input('compte_destination'))){
            $validatedData = $req->validate([
                'montant' => 'required|numeric',
                'description'=> 'required|string',
            ]);
            $transactionProvenance = Transaction::create([
                'compte_id'=>$req->input('compte_id'),
                'type_transaction_id'=>$typeTransactionProvenance,
                'description'=>$validatedData['description'],
                'montant'=>$validatedData['montant']

            ]);
            $transactionDestination = Transaction::create([
                'compte_id'=>$req->input('compte_destination'),
                'type_transaction_id'=>$typeTransactionDestination,
                'description'=>$validatedData['description'],
                'montant'=>$validatedData['montant']
            ]);
        }else{
            return back()->withErrors(['msg'=>__('app.unauthorized').' !']);
        }
    }

    public function modifier(Request $request){
        if (Gate::denies('gerer-toutes-transactions')) {
            return redirect(route('utilisateur.index'))->withErrors([__('app.unauthorized'). "!"]);
        }
        if (!Transaction::where('id', $request->input('id'))->exists()) {
            return redirect(route('transaction.index'))->withErrors([__('app.bad_id')]);
        }
        $comptes = Compte::all();
        $transaction = Transaction::find($request->input('id'));
        $utilisateurs = Utilisateur::all();
        return View('Transaction.modifier',['transaction'=>$transaction, 'comptes'=>$comptes, 'utilisateurs'=>$utilisateurs]);
    }
    public function supprimer(Request $request)
    {
        if (Gate::denies('gerer-toutes-transactions')) {
            return redirect(route('utilisateur.index'))->withErrors([__('app.unauthorized'). "!"]);
        }
        if (!Transaction::where('id', $request->input('id'))->exists()) {
            return redirect(route('transaction.index'))->withErrors([__('app.bad_id')]);
        }
        Transaction::find($request->input('id'))->delete();
        return back()->with('succes', __('app.delete_success'));

    }
    public function validerModifier(Request $request){
        if (Gate::denies('gerer-toutes-transactions')) {
            return redirect(route('utilisateur.index'))->withErrors([__('app.unauthorized'). "!"]);
        }
        if (!Transaction::where('id', $request->input('id'))->exists()) {
            return redirect(route('transaction.index'))->withErrors([__('app.bad_id')]);
        }

        $validatedData = $request->validate([
            'compte_id'=>'required|integer',
            'image_cheque' => 'nullable|mimes:jpeg,jpg,png,gif|max:100000',
            'montant' => 'required|numeric',
            'description'=> 'required|string',
        ]);
        $transaction = Transaction::find($request->input('id'));
        $transaction->montant = $validatedData['montant'];
        $transaction->description = $validatedData['description'];
        if($request->has('image_cheque')){
            Image::where('transaction_id',$transaction->id)->delete();
            $image = Image::create([
                'transaction_id'=>$transaction->id,
                'fichier'=>$transaction->id.".".$request->file('image_cheque')->extension()
            ]);


            $request->file('image_cheque')->storeAs('cheques', $image->fichier);
        }
        $transaction->compte_id = $validatedData['compte_id'];
        $transaction->save();
        return redirect(route('transaction.index'));
    }
    public function ajouterAdmin(){
        $utilisateurs = Utilisateur::select('id','nom', 'courriel')->get();


        return view('Transaction.ajouter_admin', ['utilisateurs'=>$utilisateurs]);
    }
    public function validerAjouterAdmin(Request $request){

        if($request->input('montant')<0)$type_transaction = 3;else $type_transaction=1;
        $transactionDestination = Transaction::create([
            'compte_id'=>$request->input('compte_id'),
            'type_transaction_id'=>$type_transaction,
            'description'=>"Effectué par la banque",
            'montant'=>abs($request->input('montant'))
        ]);
        return redirect(route('transaction.index'));

    }
}
