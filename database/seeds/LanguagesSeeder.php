<?php

use App\Models\RefRoleUtilisateur;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LanguagesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('languages')->insert([
            'language'=>'en',

        ]);
        DB::table('languages')->insert([
            'language'=>'es',

        ]);
    }
}
