<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTableAccessMenuTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('table_access_menu', function (Blueprint $table) {
            $table->id();
            $table->foreignId('table_usermenu_id')
                ->constrained()
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreignId('role_id')
            ->constrained()
            ->onDelete('cascade')
            ->onUpdate('cascade');
            $table->boolean('is_access')->nullable();
            $table->boolean('is_create')->nullable();
            $table->boolean('is_edit')->nullable();
            $table->boolean('is_delete')->nullable();
            $table->boolean('is_approve')->nullable();
            $table->boolean('is_reject')->nullable();
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
        Schema::dropIfExists('table_access_menu');
    }
}
