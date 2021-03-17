<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Hash;
use App\Models\User;
use Illuminate\Support\facades\Auth;
use Illuminate\Support\facades\redirect;
use App\Models\order;
use App\Models\cart;
use App\Models\adminOrder;



class OrderController extends Controller
{
  public function __construct()
    {
        $this->middleware('auth:admin');
    }


    public function index()
    {  
           
        return view('admin.manageOrder.orderIndex');
    }





 


    public function latestOrder()
    {
      $latestOrderUser=adminOrder::where('userOrder_ip',NULL)
                                  ->where('delivary',NULL)
                                  ->get();
      $latestOrderIp=adminOrder::where('userOrder_id',NULL)
                                ->where('delivary',NULL)
                                ->get();
      return view('admin.manageOrder.showOrder',compact('latestOrderUser','latestOrderIp'));
    }


    public function adminThisUserOrder($id)
    {
          $order= order::where('user_id',$id)
                       ->Where('conferm',0)
                       ->get(); 
          $orders= order::where('user_id',$id)
                       ->Where('conferm',0)
                       ->first();
         
          //return response()->json($orders);
          $a=$id;
        return view('admin.manageOrder.confermOrder',compact('order','orders','a'));

    } 


    
    public function adminThisUserOrderIp($id)
    {
          $order= order::Where('conferm',0)
                       ->Where('ip_address',$id)
                       ->get();
          $orders= order::Where('conferm',0)
                       ->Where('ip_address',$id)
                       ->first(); 
          //return response()->json($orders);
          $a=$id;
        return view('admin.manageOrder.confermOrder',compact('order','orders','a'));

    } 










    public function adminConfermOrder($id)
    {
        $cart=cart::Where('user_id',$id)
                   ->orWhere('ip_address',$id)->get();

        $order=order::Where('user_id',$id)
                   ->orWhere('ip_address',$id)->get();

     //   return response()->json($cart);
          foreach( $cart  as $row)
          {
              $a=cart::find($row->id); 
              $a->conferm=1;
              $a->save();
          }

          foreach( $order  as $row)
          {
              $a=order::find($row->id); 
              $a->conferm=1;
              $a->save();
          }

          $user_id=adminOrder::Where('userOrder_id',$id)
                           ->orWhere('userOrder_ip',$id)->get();
          foreach( $user_id  as $row)
          {
             $adminOrder=adminOrder::find($row->id);
             $adminOrder->delivary=1;
             $adminOrder->save();
          }
        
       return redirect()->route('order'); 
    }


    public function adminDelivaryOrder()
    {
      $adminOrder=adminOrder::where('delivary',1)
                              ->where('userOrder_ip',NULL)->get();
      $adminOrders=adminOrder::where('delivary',1)
                              ->where('userOrder_id',NULL)->get();
        //return response()->json($adminOrder);
      return view('admin.manageOrder.orderDelivary',compact('adminOrder','adminOrders'));
    }

    public function adminOrderDelivaryId($id)
    {
      
             $order=order::where('user_id',$id)           
               ->get();
        
            $orders=order::where('user_id',$id)           
               ->first();
      $a=$id;
      return view('admin.manageOrder.orderDelivarySingle',compact('order','orders','a'));

    }
  
  public function adminOrderDelivaryIp($id)
    {
      
      $order=order::where('ip_address',$id)           
               ->get();
         

      $orders=order::where('ip_address',$id)           
               ->first();
      $a=$id;
      return view('admin.manageOrder.orderDelivarySingle',compact('order','orders','a'));

    }
}
