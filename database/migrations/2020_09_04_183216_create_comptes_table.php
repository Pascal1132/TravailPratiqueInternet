<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateComptesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comptes', function (Blueprint $table){
            $table->increments('id');
            $table->unsignedInteger('type_compte_id');
            $table->unsignedInteger('utilisateur_id');

            $table->foreign('utilisateur_id')
                ->references('id')->on('utilisateurs')
                ->onDelete('cascade');
            $table->foreign('type_compte_id')->references('id')->on('ref_types_compte');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('comptes');
    }
}
