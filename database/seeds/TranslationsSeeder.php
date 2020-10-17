<?php

use Illuminate\Database\Seeder;

class TranslationsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //TYPES TRANSACTIONS
        $group = 'types_transaction';
        $this->creerTraduction($group, 'deposit', ['Dépôt', 'Deposit', 'Depositar']);
        $this->creerTraduction($group, 'check_deposit', ['Dépôt par chèque', 'Check deposit', 'Cheque deposito']);
        $this->creerTraduction($group, 'withdrawal', ['Retrait', 'Withdrawal', 'Retirada']);
        //TYPES COMPTES
        $group = 'types_compte';
        $this->creerTraduction($group, 'check', ['Chèque', 'Check', 'Cheque']);
        $this->creerTraduction($group, 'saving', ['Épargne', 'Saving', 'Ahorros']);
        $this->creerTraduction($group, 'tfsa', ['CELI', 'TFSA', 'Ahorros Libre de Impuestos']);
        $this->creerTraduction($group, 'rrsp', ['RÉER', 'RRSP', 'Ahorros para la jubilación']);
//TYPES ROLES
        $group = 'types_role';
        $this->creerTraduction($group, 'cashier', ['Caissier', 'Cashier', 'Cajero']);
        $this->creerTraduction($group, 'customer', ['Client', 'Customer', 'Cliente']);
        $this->creerTraduction($group, 'admin', ['Admin', 'Admin', 'Administración']);


    }
    public function creerTraduction($group, $key, $values){
       for ($i=1; $i<4;$i++){

           DB::table('translations')->insert([

               'language_id'=>$i,
               'group'=>$group,
               'key'=>$key,
               'value'=>$values[$i-1]
           ]);
       }


    }
}
