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
            'type'=>'deposit',
            'estMontantNegatif' => false

        ]);
        RefTypeTransaction::insert([
            'type'=>'check_deposit',
            'estMontantNegatif' => false

        ]);
        RefTypeTransaction::insert([
            'type'=>'withdrawal',
            'estMontantNegatif' => true

        ]);

    }
}
