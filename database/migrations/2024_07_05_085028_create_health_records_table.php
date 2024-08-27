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
        Schema::create('health_records', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('animal_id');
            $table->unsignedBigInteger('paravet_id');
            $table->unsignedBigInteger('farm_id');
            $table->date('visit_date');
            $table->decimal('weight', 5, 2)->nullable();
            $table->decimal('body_temperature', 4, 2)->nullable();
            $table->integer('heart_rate')->nullable();
            $table->integer('respiratory_rate')->nullable();
            $table->decimal('body_condition_score', 3, 1)->nullable();
            $table->text('skin_condition')->nullable();
            $table->text('mucous_membranes')->nullable();
            $table->text('hoof_condition')->nullable();
            $table->string('appetite')->nullable();
            $table->text('behavior')->nullable();
            $table->text('gait_posture')->nullable();
            $table->text('signs_of_pain')->nullable();
            $table->text('fecal_exam_results')->nullable();
            $table->text('blood_test_results')->nullable();
            $table->text('urine_test_results')->nullable();
            $table->text('medications')->nullable();
            $table->text('vaccinations')->nullable();
            $table->text('procedures')->nullable();
            $table->text('follow_up_actions')->nullable();
            $table->text('overall_health_status')->nullable();
            $table->text('environmental_factors')->nullable();
            $table->text('notes')->nullable();
            $table->timestamps();
            $table->softDeletes();

            $table->foreign('animal_id')->references('id')->on('farm_animals')->onDelete('cascade');
            $table->foreign('farm_id')->references('id')->on('farms')->onDelete('cascade');
            $table->foreign('paravet_id')->references('id')->on('vets');
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('health_records');
    }
    
};
