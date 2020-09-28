<?php

use App\Models\RefRoleUtilisateur;
use Illuminate\Database\Seeder;

class RefRolesUtilisateurSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        RefRoleUtilisateur::insert([
            'type'=>'standard',

        ]);
        RefRoleUtilisateur::insert([
            'type'=>'admin',

        ]);
    }
}
