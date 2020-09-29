<?php

use App\Models\RefTypeTransaction;
use Illuminate\Database\Seeder;

class RefTypesTransactionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        RefTypeTransaction::insert([
            'type'=>'Dépot',
            'estMontantNegatif' => false

        ]);
        RefTypeTransaction::insert([
            'type'=>'Retrait',
            'estMontantNegatif' => true

        ]);

    }
}
