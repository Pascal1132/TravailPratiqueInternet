<?php

namespace App\Http\Controllers\Auth;

use App\Mail\ConfirmationCourriel;
use App\Models\RefRoleUtilisateur;
use App\Models\Utilisateur;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;


/**
 * Class RegisterController
 * @package App\Http\Controllers\Auth
 */
class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/index';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {

        return Validator::make($data, [
            'nom' => 'required|string|max:255',
            'courriel' => 'required|string|email|max:255|unique:utilisateurs',
            'mot_de_passe' => 'required|string',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\Utilisateur
     */
    protected function create(array $data)
    {
        //TODO REMPLACER EN PRODUCTION
        $adminRole = RefRoleUtilisateur::where('type', 'admin')->firstOrFail();

        $utilisateur = Utilisateur::create([
            'nom' => $data['nom'],
            'courriel' => $data['courriel'],
            'no_carte' => self::genererCarteId(),
            'mot_de_passe' => bcrypt($data['mot_de_passe']),
            'confirmation_token' => bcrypt($data['courriel'] . $data['nom'] . self::genererCarteId()),
        ]);


        $utilisateur->roles()->attach($adminRole);


        return $utilisateur;
    }

    /**
     * Permet de générer une valeur aléatoire de 16 entiers unique à la table Utilisateur
     * @return int
     * @throws \Exception
     */
    public static function genererCarteId(){
        $i = 0;
        do{
            $carteNo = 7489;
            for ($j=0; $j<12; $j++){
                $carteNo .= rand(0,9);
            }

            $i++;
        }while (Utilisateur::where('no_carte', $carteNo)->exists() && $i<90000000000);
        if($i==90000000000)throw new \Exception('Aucune carte ne peut être générée');
        return $carteNo;
    }

    protected function registered(Request $request, $user)
    {
        $courriel = new ConfirmationCourriel();
        Mail::to($user->courriel)->send($courriel);
    }
}
