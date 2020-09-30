<?php

namespace App\Http\Controllers\Auth;

use App\Models\RefRoleUtilisateur;
use App\Models\Utilisateur;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;


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
            'no_carte' => 'required|string|max:16|unique:utilisateurs',
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
        $adminRole = RefRoleUtilisateur::where('type', 'admin')->first();
        $caissierRole = RefRoleUtilisateur::where('type', 'caissier')->first();
        $standardRole = RefRoleUtilisateur::where('type', 'standard')->first();
        $utilisateur = Utilisateur::create([
            'nom' => $data['nom'],
            'courriel' => $data['courriel'],
            'no_carte' => $data['no_carte'],
            'mot_de_passe' => bcrypt($data['mot_de_passe']),

        ]);
        $utilisateur->roles()->attach($adminRole);
        return $utilisateur;
    }
}
