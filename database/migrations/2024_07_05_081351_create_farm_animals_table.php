<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('farm_animals', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('farm_id');
            $table->string('type');
            $table->string('tag_number')->unique();
            $table->string('species')->nullable();
            $table->string('gender')->nullable();
            $table->date('date_of_birth')->nullable();
            $table->string('color')->nullable();
            $table->string('current_location')->nullable();
            $table->float('weight')->nullable();
            $table->integer('body_condition_score')->nullable();
            $table->text('health_history')->nullable();
            $table->text('medications')->nullable();
            $table->text('vaccinations')->nullable();
            $table->text('dietary_requirements')->nullable();
            $table->text('parentage')->nullable();
            $table->text('behavioral_notes')->nullable();
            $table->text('handling_requirements')->nullable();
            $table->text('management_notes')->nullable();
            $table->text('feeding_schedule')->nullable();
            $table->timestamps();
            $table->softDeletes();

            $table->foreign('farm_id')->references('id')->on('farms')->onDelete('cascade');
        });
    }


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('farm_animals');
    }
};
