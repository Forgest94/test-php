<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Prize extends Model
{
    use HasFactory;
    protected $fillable = [
        "fact_sum"
    ];

    public function TypePrize()
    {
        return $this->hasMany('App\Models\TypePrize', 'id', 'type_prizes_id');
    }
}
