<?php

namespace App\Providers;

use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();
        Gate::define('afficher-utilisateurs', function ($utilisateur){
            return $utilisateur->hasAnyRoles(['admin', 'cashier']);
        });
        Gate::define('afficher-tous-comptes', function ($utilisateur){
            return $utilisateur->hasAnyRoles(['admin', 'cashier']);
        });
        Gate::define('gerer-tous-comptes', function ($utilisateur){
            return $utilisateur->hasAnyRoles(['admin']);
        });
        Gate::define('gerer-toutes-transactions', function ($utilisateur){
            return $utilisateur->hasAnyRoles(['admin', 'cashier']);
        });
        Gate::define('gerer-tous-comptes', function ($utilisateur){
            return $utilisateur->hasAnyRoles(['admin']);
        });
        Gate::define('modifier-utilisateurs', function ($utilisateur){
            return $utilisateur->hasRole('admin');
        });
        Gate::define('effacer-utilisateurs', function ($utilisateur){
            return $utilisateur->hasRole('admin');
        });

    }
}
