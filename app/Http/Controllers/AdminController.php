<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\product;
use App\Models\ProductImage;
use App\Models\catagory;
use Image;

class AdminController extends Controller
{
public function __construct()
    {
        $this->middleware('auth:admin');
    }

  public function adminManageProduct()
  {

      return view('admin.manageProduct.productIndex');

  }

public function adminAddProduct()
  {
    $catagory = catagory::orderBy('id','desc')->get();

      return view('admin.manageProduct.addProduct',compact('catagory'));

  }



	public function addproduct()
	{
            return view('admin.index');
	}

    public function addproductmain()
  {
            return view('admin.index');
  }

	public function addall(Request $request)
	{

        $request->validate([
        'title' => 'required|max:255',
        'description' => 'required',
        'price' => 'required',
        'quantity' => 'required',
        'Image' => 'required',

    ]);




		$product=new product;
		$product->title=$request->title;
		$product->description=$request->description;
		$product->price=$request->price;
		$product->quantity=$request->quantity;
		$product->slug=$request->slug;
		$product->catagory_id=1;
		$product->brand_id=1;
		$product->admin_id=1;
        $product->save();


        // if($request->hasFile('Image'))
        // {
        //    $image=  $request->file('Image') ;
        //    $img=time().'.'.$image->getClientOriginalExtension();
        //    $location=public_path('front-end/Image' .$img);
        //    Image::make($image)->save($location);
        //    $product_image=new ProductImage;
        //    $product_image->product_id=$product->id;
        //    $product_image->image=$img;
        //    $product_image->save();
        //      return view('home');
        // }


         
         if(count($request->Image)>0)
         {
           foreach ($request->Image as $image) {
           
          // $image=  $request->file('Image[]') ;
           $img=time().'.'.$image->getClientOriginalExtension();
           
           $product_image=new ProductImage;
           $product_image->product_id=$product->id;
           $product_image->image=$img;
           $product_image->save();
             
        
           }
         }
         return view('admin.manageProduct.productIndex');

	}
  


   public function adminProductView($id){
      $product=product::findorfail($id);
     return view('admin.manageProduct.editProduct',compact('product'));   
            //return response()->json($student);

    }

public function adminProductUpdate(Request $request,$id){
   


    $product=new product;
    $product = product::find($id); 
    $product->title=$request->title;
    $product->description=$request->description;
    $product->price=$request->price;
    $product->quantity=$request->quantity;
    $product->slug='vzsfbn';
    $product->catagory_id=1;
    $product->brand_id=1;
    $product->admin_id=1;
        $product->save();


        // if($request->hasFile('Image'))
        // {
        //    $image=  $request->file('Image') ;
        //    $img=time().'.'.$image->getClientOriginalExtension();
        //    $location=public_path('front-end/Image' .$img);
        //    Image::make($image)->save($location);
        //    $product_image=new ProductImage;
        //    $product_image->product_id=$product->id;
        //    $product_image->image=$img;
        //    $product_image->save();
        //      return view('home');
        // }


         
         if(count($request->Image)>0)
         {
           foreach ($request->Image as $image) {
           
          // $image=  $request->file('Image[]') ;
           $img=time().'.'.$image->getClientOriginalExtension();
           $location=public_path('front-end/Image' .$img);
           Image::make($image)->save($location);
           $product_image=new ProductImage;
           $product_image->product_id=$product->id;
           $product_image->image=$img;
           $product_image->save();
             
        
           }
         }
     // return response()->json($request);
         return view('admin.manageProduct.productIndex');

    }
 public function adminProductShow(){
        
       $product = product::all();
        return view('include.productTable',compact('product'));
    }



 public function adminProductDelete($id){
    //return response()->json($student);
      $product=new product;
      $product=product::findorfail($id);
      $product->delete();
     //  $product_image=new ProductImage;
     //  $product_image->product_id=$product->id;
     //  // $catagory=new catagory;
     // $product_image=ProductImage::findorfail($product_image->product_id);
     // $product_image->delete();


      return view('admin.manageProduct.productIndex');
     // return response()->json($product);

    }


   public function adminCatagoryShow()
   {
    return view('admin.manageCatagory.indexCatagory');
   }

   public function adminAddCatagory()
   {
     return view('admin.manageCatagory.addCatagory');
   }

   public function adminCatagorySave(Request $request)
   {
     
       $name=$request->name;
       $description=$request->description;
       
   
       $image=$request->file('file')->getClientOriginalExtension();
      $a=$request->file('file')->store('ss'.$image);
      

      //$request->image->store('public');
       $catagory= new catagory();
       $catagory->name=$name;
       $catagory->description=$description;
       $catagory->image=$a;
       // return response()->json($a);
       $catagory->save();
      
      return redirect()->route('adminCatagory');  
         
   }

  public function adminShowCatagory()
  {
    $catagory=catagory::orderBy('id','asc')->get();
    return view('admin.manageCatagory.delateCatagry',compact('catagory'));
  }

}
