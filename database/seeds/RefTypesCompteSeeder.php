<?php

use App\Models\RefTypeCompte;
use Illuminate\Database\Seeder;

class RefTypesCompteSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        RefTypeCompte::insert([
            'type'=>'Chèque',

        ]);
        RefTypeCompte::insert([
            'type'=>'Épargne',

        ]);
        RefTypeCompte::insert([
            'type'=>'CELI',

        ]);
        RefTypeCompte::insert([
            'type'=>'RÉER',

        ]);
    }
}
