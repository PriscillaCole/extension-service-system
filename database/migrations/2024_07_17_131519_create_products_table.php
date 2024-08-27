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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('provider_id')->nullable();
            $table->unsignedBigInteger('farmer_id')->nullable();
            $table->string('name');
            $table->text('description');
            $table->string('manufacturer');
            $table->decimal('price', 8, 2);
            $table->integer('quantity_available');
            $table->date('expiry_date')->nullable();
            $table->text('storage_conditions')->nullable();
            $table->text('usage_instructions')->nullable();
            $table->text('warnings')->nullable();
            $table->string('status');
            $table->string('image')->nullable();
            $table->integer('stock');
            $table->string('category');

            $table->foreign('provider_id')->references('id')->on('service_providers');
            $table->foreign('farmer_id')->references('id')->on('farmers');
            
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
