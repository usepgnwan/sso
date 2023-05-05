<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTableUsermenuTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('table_usermenu', function (Blueprint $table) {
            $table->id();
            $table->integer('parent_id');
            $table->string('menu',100);
            $table->string('icon',100)->nullable();
            $table->integer('weight')->nullable();
            $table->boolean('iscrud')->nullable();
            $table->string('url',255)->nullable();
            $table->string('type'); //menu / devider
            $table->boolean('status');
            $table->boolean('is_approve_reject');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('table_usermenu');
    }
}
