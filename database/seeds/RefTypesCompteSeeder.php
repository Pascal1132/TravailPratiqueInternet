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
            'type'=>'check',

        ]);
        RefTypeCompte::insert([
            'type'=>'saving',

        ]);
        RefTypeCompte::insert([
            'type'=>'tfsa',

        ]);
        RefTypeCompte::insert([
            'type'=>'rrsp',

        ]);
    }
}
