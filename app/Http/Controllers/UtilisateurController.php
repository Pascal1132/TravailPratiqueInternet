<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Auth\RegisterController;
use App\Mail\ConfirmationCourriel;
use App\Models\RefRoleUtilisateur;
use App\Models\Utilisateur;
use Hamcrest\Util;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

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
    public function accueil()
    {
        return view('Utilisateur.accueil');
    }

    public function listeComptes()
    {
        return view('Compte.accueil');
    }
    public function afficherCompte()
    {
        return view('Compte.modifier');
    }
    public function index(){
        if(Gate::denies('afficher-utilisateurs')){
            return redirect('home');
        }


        return view('Utilisateur.index', ['utilisateurs'=>Utilisateur::all()]);
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
    public function validationModifier(Request $request){


        $validatedData=  $request->validate( [
            'nom' => 'required|string|max:255',
            'courriel' => 'required|string|email|max:255|unique:utilisateurs,courriel,'.$request->input('id'),
            'mot_de_passe' => 'sometimes',
            'role'=> 'sometimes|integer',
        ]);



        $utilisateur = Utilisateur::find($request->input('id'));
        $utilisateur->nom = $validatedData['nom'];
        if(!is_null($request->input('mot_de_passe'))) $utilisateur->mot_de_passe =  bcrypt($validatedData['mot_de_passe']);

        if(!($validatedData['courriel']==$utilisateur->courriel)){
            $utilisateur->courriel = $validatedData['courriel'];
            $utilisateur->confirmation_token = bcrypt($validatedData['courriel'] . $utilisateur->nom . RegisterController::genererCarteId());
            $utilisateur->confirme = 0;

        }


        if(!is_null($request->input('role'))){
            $role = RefRoleUtilisateur::where('id',$validatedData['role'])->firstOrFail();
            $roleAvant = RefRoleUtilisateur::where('id',(Utilisateur::find($request->input('id'))->first())->getFirstRole()->id)->firstOrFail();
            $utilisateur->roles()->detach($roleAvant);
            $utilisateur->roles()->attach($role);
        }

        $utilisateur->save();
        $courriel = new ConfirmationCourriel();
        if(!($validatedData['courriel']==$utilisateur->courriel)) Mail::to($utilisateur->courriel)->send($courriel);




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
    public function supprimer(Request $request){
        if(Gate::denies('modifier-utilisateurs')){
            return redirect('/')->withErrors([ __('app.unauthorized') . " !"]);
        }
        Utilisateur::find($request->input('id'))->delete();
        RefRoleUtilisateur::where('utilisateur_id', $request->input('id'))->delete();
        return back()->with('succes', __('app.delete_success'));
    }


}
