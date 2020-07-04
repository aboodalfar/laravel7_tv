<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTablesTv extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('series', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->text('description')->nullable();
            $table->timestamp('airing_time')->nullable();
            $table->timestamps();
        });
        
        Schema::create('episodes', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->text('description')->nullable();
            $table->string('duration');
            $table->timestamp('airing_time')->nullable();
            $table->string('thumb')->nullable();
            $table->string('video')->nullable();
            $table->integer('series_id');
            $table->integer('total_likes')->default(0);
            $table->integer('total_dislikes')->default(0);
            $table->timestamps();
        });
        
        Schema::create('episode_likes', function (Blueprint $table) {
            $table->id();
            $table->integer('episode_id');
            $table->integer('user_id');
            $table->boolean('status')->nullable();
            $table->timestamps();
        });
        
        Schema::create('series_followings', function (Blueprint $table) {
            $table->id();
            $table->integer('series_id');
            $table->integer('user_id');
            $table->boolean('status')->nullable();
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
        Schema::dropIfExists('series');
        Schema::dropIfExists('episodes');
    }
}
