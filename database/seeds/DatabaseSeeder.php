<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->call(RefRolesUtilisateurSeeder::class);
        $this->call(RefTypesCompteSeeder::class);
        $this->call(RefTypesTransactionSeeder::class);
        $this->call(LanguagesSeeder::class);
        $this->call(TranslationsSeeder::class);
    }
}
