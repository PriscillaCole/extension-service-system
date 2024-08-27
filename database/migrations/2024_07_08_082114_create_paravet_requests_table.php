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
        Schema::create('paravet_requests', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('user_id');
            $table->unsignedBigInteger('paravet_id')->nullable();
            $table->string('location');
            $table->string('status')->default('pending');
            $table->text('description');
            $table->date('date');
            $table->time('time');
            $table->string('rejected_reason')->nullable();
            $table->softDeletes();

            $table->foreign('user_id')->references('id')->on('admin_users')->onDelete('cascade');
            $table->foreign('paravet_id')->references('id')->on('vets');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('paravet_requests');
    }
};
