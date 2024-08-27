<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('farmers', function (Blueprint $table) {
            $table->id();
            $table->string('profile_picture')->nullable();
            $table->string('surname');
            $table->string('given_name');
            $table->string('gender');
            $table->date('date_of_birth');
            $table->string('nin');
            $table->string('marital_status')->nullable();
            $table->string('primary_phone_number');
            $table->string('secondary_phone_number')->nullable();
            $table->string('physical_address');
            $table->string('cooperative_association')->nullable();
            $table->boolean('is_land_owner')->default(false);
            $table->string('production_scale');
            $table->boolean('access_to_credit')->nullable();
            $table->integer('farming_experience');
            $table->string('education')->nullable();
            $table->string('status')->default('active');
            $table->unsignedInteger('user_id');
            $table->unsignedInteger('added_by')->nullable();
            $table->timestamps();
            $table->softDeletes();

            $table->foreign('user_id')->references('id')->on('admin_users')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('added_by')->references('id')->on('admin_users')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::disableForeignKeyConstraints();
        Schema::dropIfExists('farmers');
        Schema::enableForeignKeyConstraints();
    }
};
