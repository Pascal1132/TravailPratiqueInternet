<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Session;

class LangueController extends Controller
{


    public function chgLang(){
        $prochaineLangue = '';
        switch (Config::get('app.locale')){
            case 'fr':
                $prochaineLangue = 'en';
                break;
            case 'en':
                $prochaineLangue = 'es';
                break;
            case 'es':
                $prochaineLangue = 'fr';
                break;
        }


            Session::put('language',$prochaineLangue);
            App::setLocale($prochaineLangue);

        return back();
    }
}
