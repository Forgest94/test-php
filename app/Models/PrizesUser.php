<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PrizesUser extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'prize_id',
        'sum',
        'product_id',
        'status_id',
    ];

    public function Prize()
    {
        return $this->hasMany('App\Models\Prize', 'id', 'prize_id');
    }
    public function Product()
    {
        return $this->hasMany('App\Models\Product', 'id', 'product_id');
    }
    public function Status()
    {
        return $this->hasMany('App\Models\StatusPrizesUser', 'id', 'status_id');
    }
}
