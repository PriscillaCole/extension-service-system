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
        Schema::create('farms', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('coordinates')->nullable();
            $table->json('livestock_type')->nullable()->comment('e.g., ["cattle", "sheep", "goats"]');
            $table->json('production_type')->nullable()->comment('e.g., ["milk", "eggs", "meat"]');
            $table->string('date_of_establishment')->nullable();
            $table->string('size')->nullable();
            $table->string('profile_picture')->nullable();
            $table->integer('number_of_animals')->nullable();
            $table->json('farm_structures')->nullable()->comment('e.g., ["barn", "silo", "pen"]');
            $table->text('general_remarks')->nullable();
            $table->unsignedInteger('owner_id')->nullable();
            $table->unsignedInteger('added_by')->nullable();
            $table->softDeletes();
            $table->timestamps();

            $table->foreign('added_by')->references('id')->on('admin_users');
            $table->foreign('owner_id')->references('id')->on('admin_users')->onDelete('cascade');
        });
    }
    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::disableForeignKeyConstraints();
        Schema::dropIfExists('farms');
        Schema::enableForeignKeyConstraints();
    }
};
