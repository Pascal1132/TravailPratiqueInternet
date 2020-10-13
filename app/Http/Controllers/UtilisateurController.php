<?php

namespace App\Http\Controllers;

use App\Mail\ConfirmationCourriel;
use App\Models\RefRoleUtilisateur;
use App\Models\Utilisateur;
use Hamcrest\Util;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Mail;

class UtilisateurController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth')->except([
            'confirmer'
        ]);
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
        return back()->with('succes',__('app.'.'updated') . ' !');
    }
    public function confirmer(Request $request){
        if($request->has('token')){

            if(Utilisateur::where('confirmation_token', urldecode($request->input('token')))->where('confirme', 0)->exists() ){
                $utilisateur = Utilisateur::where('confirmation_token', urldecode($request->input('token')))->first();
                $utilisateur->confirme = true;
                $utilisateur->save();
                if(Auth::check())
                return redirect('/index')->with('succes',__('email.email_confirmed'));
                else return redirect('/conn')->with('succes',__('email.email_confirmed'));
            }
            if(Auth::check())
                return redirect('/index')->withErrors([ __('email.invalid_token')]);
            else return redirect('/conn')->withErrors([__('email.invalid_token')]);

        }
        if(Auth::user()->confirme) return redirect('/index')->with('succes',__('email.email_already_confirmed'));
        return view('Utilisateur.confirmer');
    }
    public function envoiCourrielConfirmation(){

        $courriel = new ConfirmationCourriel();
        Mail::to(Auth::user()->courriel)->send($courriel);
        return back()->with('succes','Le courriel a bien été envoyé!');
    }

}
