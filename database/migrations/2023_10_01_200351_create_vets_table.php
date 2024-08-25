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
        Schema::create('vets', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('user_id')->nullable();
            $table->string('profile_picture')->nullable();
            $table->string('title');
            $table->string('category')->nullable()->comment('Paravet or Vet');
            $table->string('surname');
            $table->string('given_name');
            $table->date('date_of_birth');
            $table->string('gender');
            $table->string('education');
            $table->string('marital_status');
            $table->string('group_or_practice')->nullable();
            $table->string('registration_number')->nullable();
            $table->string('registration_date')->nullable();
            $table->string('brief_profile')->nullable();
            $table->string('physical_address')->nullable();
            $table->string('email')->nullable();
            $table->string('primary_phone_number')->nullable();
            $table->string('secondary_phone_number')->nullable();
            $table->string('postal_address')->nullable();
            $table->string('services_offered')->nullable();
            $table->string('areas_of_operation')->nullable();
            $table->string('certificate_of_registration')->nullable();
            $table->string('license')->nullable();
            $table->json('other_documents')->nullable();
            $table->string('status')->default('pending');
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
        Schema::dropIfExists('vets');
    }
};
