<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateIdentifiersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('identifiers', function (Blueprint $table) {
            $table->enum('use', ['usual', 'official', 'temp', 'secondary', 'old (If known)'])->default('usual');
            $table->string('type');
            $table->string('system')->nullable();
            $table->uuid('value')->primary()->nullable(false);
            $table->uuid('period')->nullable();
            $table->string('assigner')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('identifiers');
    }
}
