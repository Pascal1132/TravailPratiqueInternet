<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTransactionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transactions', function (Blueprint $table){
            $table->increments('id');
            $table->unsignedInteger('compte_id');

            $table->unsignedInteger('type_transaction_id');
            $table->string('description');


            $table->foreign('compte_id')
                ->references('id')->on('comptes')
                ->onDelete('cascade');
            $table->foreign('type_transaction_id')->references('id')->on('ref_types_transaction')->onDelete('cascade');





        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transactions');
    }
}
