<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'provider_id',
        'name',
        'description',
        'manufacturer',
        'price',
        'quantity_available',
        'expiry_date',
        'storage_conditions',
        'usage_instructions',
        'warnings',
        'status',
        'image',
        'stock',
        'category',
    ];
}
