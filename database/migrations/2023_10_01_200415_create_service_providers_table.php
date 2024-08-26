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
        Schema::create('service_providers', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('owner_name')->nullable();
            $table->text('owner_profile')->nullable();
            $table->string('provider_category')->nullable();
            $table->string('provider_type')->nullable();
            $table->string('ursb_incorporation_number')->nullable();
            $table->date('date_of_incorporation')->nullable();
            $table->string('type_of_shop')->nullable();
            $table->date('date_of_registration')->nullable();
            $table->string('physical_address')->nullable();
            $table->string('primary_phone_number')->nullable();
            $table->string('secondary_phone_number')->nullable();
            $table->string('email')->nullable();
            $table->string('postal_address')->nullable();
            $table->string('other_services')->nullable();
            $table->string('logo')->nullable();
            $table->string('district_of_operation')->nullable();
            $table->string('NDA_registration_number')->nullable();
            $table->string('tin_number_business')->nullable();
            $table->string('tin_number_owner')->nullable();
            $table->string('license')->nullable();
            $table->string('status')->default('pending');
            $table->json('other_documents')->nullable();
            $table->unsignedInteger('user_id')->nullable();
            $table->unsignedInteger('added_by')->nullable();
            $table->softDeletes();
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('admin_users')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('added_by')->references('id')->on('admin_users');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('service_providers');
    }
};
