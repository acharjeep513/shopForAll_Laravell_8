<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\ProductImage;
use App\Models\cart;
use Auth;

class product extends Model
{
    use HasFactory;
     public function productImage(){
    	return $this->hasOne(ProductImage::class);
     }

    public static function cart()
      {
       
       if(Auth::check()){

      $carts=cart::Where('user_id',Auth::id())
                   ->Where('conferm',NULL)
                   ->get();
       }
       else{
       
        $carts=cart::Where('ip_address',request()->ip())
                    ->Where('conferm',NULL)
                    ->get();
       

       }

       $total_price=0;
     
       foreach ($carts as $cart) {
       $product=product::Where('id',$cart->product_id)->first();
       $total_price +=$cart->product_quantity*$product->price;
   
       }

       return $total_price;
    }


    public static function total()
    {
       
       if(Auth::check()){

      $carts=cart::Where('user_id',Auth::id())
                  
   	               ->get();
       }
       else{
       
       	$carts=cart::Where('ip_address',request()->ip())
       	            
                    ->get();
       

       }

       $total_price=0;
     
       foreach ($carts as $cart) {
        if($cart->conferm == '0')
        {
          $product=product::Where('id',$cart->product_id)->first();
          $total_price +=$cart->product_quantity*$product->price;
        }
       elseif ($cart->conferm == '1') {
          $product=product::Where('id',$cart->product_id)->first();
          $total_price +=$cart->product_quantity*$product->price;
       }
   
       }

       return $total_price;
    }

}
