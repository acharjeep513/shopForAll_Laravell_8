<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\order;
use  App\Models\User;
use  App\Models\cart;
use App\Models\product;
use Auth;
use  App\Models\review;

class cartController extends Controller
{


  public function __construct()
    {
        $this->middleware('web');
    }


   public function store(Request $request)
   {
    
//         $request->validate([
//         'product_id' => 'required|max:255',
        
//     ]
//      [
//         'product_id.required' =>'please give a product'
//      ]

// );

    $cart=cart::Where('user_id',Auth::id())
               ->where('product_id', $request->product_id)
               ->first();
                //return response()->json($cart);
                 if(!is_null($cart))
                 {
                  if($cart->conferm == 'NULL')
                 {
                  return response()->json($cart);
                 $cart->increment('product_quantity');
                 }
                 else{
                 $cart= new cart();
                  if(Auth::check())
    {
      $cart->user_id=Auth::id();
    }
    else{
        $cart->ip_address=request()->ip();
    }

       
    $cart->product_id=$request->product_id;
   
        $cart->save();
}
                  
                 }
                 else{
                 $cart= new cart();
                  if(Auth::check())
    {
      $cart->user_id=Auth::id();
    }
    else{
        $cart->ip_address=request()->ip();
    }

       
    $cart->product_id=$request->product_id;
    
        $cart->save();
}


  $order=order::orWhere('user_id',Auth::id())
               ->where('product_id', $request->product_id)
                 ->first();
                  //return response()->json($order);
                 if(!is_null($order))
                 {
                 if($order->conferm == NULL)
                 {
                 $order->increment('product_quantity');
                 }
                 else{
                 $order= new order();
                  if(Auth::check())
                {
                  $order->user_id=Auth::id();
                }
                else{
                $order->ip_address=request()->ip();
                }

       
    $order->product_id=$request->product_id;
    
    $order->save();


}
                  
                 }

                 else{
                 $order= new order();
                  if(Auth::check())
    {
      $order->user_id=Auth::id();
    }
    else{
        $order->ip_address=request()->ip();
    }

       
    $order->product_id=$request->product_id;
    
    $order->save();


}







  return redirect()->route('cart');
   }


   public function showCart()
   {
    if(Auth::check()){

      $carts=cart::Where('user_id',Auth::id())
                 ->where('conferm', NULL)
                 ->get();
      $order=cart::Where('user_id',Auth::id())
                ->get();         
       }
       else{
        $carts=cart::Where('ip_address',request()->ip())
                    ->where('conferm', NULL)
                    ->get();
        $order=cart::Where('ip_address',request()->ip())          ->get(); 
        //return response()->json($order);       
       }

  
   //return response()->json($carts);
   $review = review::orderBy('id','asc')->get();
   return view('cart.cart',compact('carts','review','order'));
       
   }




   public function update(Request $request , $id)
   {
     $cart=cart::find($id);
     if(!is_null($cart))
     {
      $cart->product_quantity =$request->product_quantity;
      $cart->save();
     }
     else
     {
      return back();
     }

     $order=order::find($id);
     if(!is_null($order))
     {
      $order->product_quantity =$request->product_quantity;
      $order->save();
     }
     else
     {
      return back();
     }


    return redirect()->route('cart');
   }







   public function delete($id)
   {
     $cart=cart::find($id);
     if(!is_null($cart))
     {

      $cart->delete();
      
     }
     else
     {
      return back();
     }

     $order=order::find($id);
     //return response()->json($order);
     if(!is_null($order))
     {

      $order->delete();
      
     }
     else
     {
      return back();
     }
      return redirect()->route('cart');
   }
   


 

   

}
