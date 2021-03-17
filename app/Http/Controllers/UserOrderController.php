<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\cart;
use App\Models\order;
use App\Models\adminOrder;
use Auth;

class UserOrderController extends Controller
{


    public function confermOrder()
    {
      
      if(Auth::check()){
       $carts=cart::Where('user_id',Auth::id())
                 ->Where('conferm',NULL)
                 ->get();
       $cart_id=Auth::id();
       }
       else{
        $carts=cart::Where('ip_address',request()->ip())
                   ->Where('conferm',NULL)
                   ->get();
        $cart_id=request()->ip();
       }
       //return response()->json($carts);
    	return view('order.showOrder',compact('carts','cart_id'));
    }


 

    public function confermOrderSave(Request $request,)
    {
      if(Auth::check())
      {
  
        $user=order::Where('user_id',Auth::id())
                    ->where('conferm',NULL)
                    ->get();
        foreach( $user  as $row)
        {
          $order=new order();
          $order=order::find($row->id); 
        
          $order->name=$request->name;
          $order->email=$request->email;
          $order->phone=$request->phone;
          $order->payment=$request->payment;
          $order->address=$request->address;
          $order->conferm=0;
          $order->save();
              }

         $d=cart::Where('user_id',Auth::id())
                    ->where('conferm',NULL)
                    ->get();
         
        foreach( $d  as $row)
        {
          $order=new cart();
          $order=cart::find($row->id);
          $order->conferm=0;
          $order->save();

          
        
        }
        //return redirect()->route('cart'); 
        $adminOrder=adminOrder::where('userOrder_id',Auth::id())->first();
                  //return response()->json($cart);
                 if(!is_null($adminOrder))
                 {
                 
                 }
                 else{
                  $userOrderId= new adminOrder();
                  $userOrderId->userOrder_id=Auth::id();
                  $userOrderId->save();
                     }
      }
       else{
          $user=order::Where('ip_address',request()->ip())
          ->where('conferm',NULL)
          ->get();
          //return response()->json($user);
          foreach( $user  as $row)
          {
          $order=new order();
          $order=order::find($row->id); 
        
          $order->name=$request->name;
          $order->email=$request->email;
          $order->phone=$request->phone;
          $order->payment=$request->payment;
          $order->address=$request->address;
          $order->conferm=0;
          $order->save();
               
          }  
          $d=cart::Where('ip_address',request()->ip())
                    ->where('conferm',NULL)
                    ->get();
         //return response()->json($d);
        foreach( $d  as $row)
        {
          
          $cart=cart::find($row->id);
          $cart->conferm=0;
          $cart->save();
        }

      $adminOrder=adminOrder::where('userOrder_ip',request()->ip())->orderBy('userOrder_ip','desc')->first();
                  //return response()->json($cart);
                 if(!is_null($adminOrder))
                 {
                  if($adminOrder->delivary ==1){
                  $userOrderId= new adminOrder();
                  $userOrderId->userOrder_ip=request()->ip();
                  $userOrderId->save();
                  }
                  
                  else
                  {

                  }
                 
                 }
                 else{
                 
                  $userOrderId= new adminOrder();
                  $userOrderId->userOrder_ip=request()->ip();
                  $userOrderId->save();
                     }     
       } 
        return redirect()->route('cart');    
    }
  



}
