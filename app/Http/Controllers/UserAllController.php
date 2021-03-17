<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\catagory;
use App\Models\slide;
use App\Models\product;

class UserAllController extends Controller
{
	public function __construct()
    {
       
        $this->middleware('web');
    }
    
    public function index(){

        $slides=slide::orderBy('id','desc')->get();
        $catagory=catagory::orderBy('id','asc')->get();
        $product=product::orderBy('id','asc')->get();
    	return view('welcome',compact('slides','catagory','product'));
    }

    public function confermOrder()
    {
    	return view('order.showOrder');
    }
}
