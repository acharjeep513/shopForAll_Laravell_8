<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\cart;
use App\Models\product;

class order extends Model
{
    public $fillable = [
       'user_id','ip_address','name','phone', 'shiping_address','email', 'massage','is_paid','is_completed','is_seen_by_admin',
    ];

    public function user()
    {
       return $this->belongsTo(User::class);
    }

    public function cart()
    {
       return $this->belongsTo(cart::class);
    }

     public function product()
    {
       return $this->belongsTo(product::class);
    }
}
