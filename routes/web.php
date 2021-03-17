<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\DivisionController;
use App\Http\Controllers\DistrictController;
use App\Http\Controllers\SlideController;
use App\Http\Controllers\navController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\NoticeController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\DashController;
use App\Http\Controllers\UserOrderController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\calculatorController;
use App\Http\Controllers\CatagoryController;
use App\Http\Controllers\slidersController;
use App\Http\Controllers\ActivityController;
use App\Http\Controllers\UserAllController;
use App\Models\slide;
use App\Models\Activity;
use App\Models\User;
use App\Models\catagory;
use App\Models\product;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/',[UserAllController::class,'index']);		
	
// Route::get('/', function () {
	 
//    $slides = slide::orderBy('id','desc')->get();
// 	$catagory = catagory::orderBy('id','asc')->get();
// 	 //return response()->json($catagory);
//     return view('welcome',compact('slides','catagory'));
// });


Route::post('/registerss', [RegisterController::class,'register']);
Route::get('/verify', [RegisterController::class,'verifyUser']  )->name('verify.user');


Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {

	$slides = slide::orderBy('id','desc')->get();
	$catagory = catagory::orderBy('id','asc')->get();
	$product = product::orderBy('id','asc')->get();
	 //return response()->json($catagory);
    return view('welcome',compact('slides','catagory','product'));
	
})->name('dashboard');


Route::get('/adminLog',[loginController::class,'showLoginForm'])->name('admin.login');
Route::post('/admin/login',[loginController::class,'login']);




Route::get('/LogAll',[AdminController::class,'addproductmain']);
Route::post('/adminadd', [AdminController::class,'addall']);
Route::get('/adminManageProduct', [AdminController::class,'adminManageProduct'] );
Route::get('/adminAddProduct', [AdminController::class,'adminAddProduct']);
Route::post('/adminProductUpdate/{id}', [AdminController::class,'adminProductUpdate']);
Route::get('/adminProductView/{id}', [AdminController::class,'adminProductView']);
Route::post('/productdelete/{id}', [AdminController::class,'adminProductDelete']);
Route::get('/adminProductShow', [AdminController::class,'adminProductShow']);

/*
|--------------------------------------------------------------------------
| Catagory routes
|--------------------------------------------------------------------------
|All Catagory route define here
|
*/
Route::get('/adminManageCatagory', [AdminController::class,'adminCatagoryShow']);
Route::get('/adminAddCatagory', [AdminController::class,'adminAddCatagory']);
Route::post('/adminCatagorySave', [AdminController::class,'adminCatagorySave']);

Route::get('/adminShowCatagory', [AdminController::class,'adminShowCatagory'])->name('adminCatagory');


/*
|--------------------------------------------------------------------------
| Catagory routes
|--------------------------------------------------------------------------
|All Catagory route define here
|
*/

Route::get('/Catagory', [CatagoryController::class,'index']);
Route::get('/Catagoryadd',[CatagoryController::class,'Catagoryadd']);
Route::post('/CatagoryAddDatabase',[CatagoryController::class,'CatagoryAddDatabase'] );
Route::get('/catagoryview/{id}',[CatagoryController::class,'catagoryview'] );
Route::post('/catagoryUpdate/{id}',[CatagoryController::class,'catagoryUpdate'] );
Route::get('/catagoryDelete/{id}',[CatagoryController::class,'catagoryDelete']);





/*
|--------------------------------------------------------------------------
| product show routes
|--------------------------------------------------------------------------
|All Catagory route define here
|
*/

Route::get('/product',[ProductController::class,'index'] );
Route::post('/productSingle/{id}',[ProductController::class,'showSingleProduct']);



/*
|--------------------------------------------------------------------------
| Division routes
|--------------------------------------------------------------------------
|All Catagory route define here
|
*/
Route::get('/adminManageDivision',[DivisionController::class,'index']);
Route::get('/adminAddDivision',[DivisionController::class,'addDivision'] );
Route::post('/divisionAdd',[DivisionController::class,'addall']);
Route::get('/adminShowDivision',[DivisionController::class,'divisionShow']);
Route::get('/adminUpdateDivision/{id}',[DivisionController::class,'divisionUpdate']);
Route::post('/adminEditedDivision/{id}',[DivisionController::class,'divisionEdited']);
Route::get('/adminDeleteDivision/{id}',[DivisionController::class,'divisionDelete']);





/*
|--------------------------------------------------------------------------
| District(admin) routes
|--------------------------------------------------------------------------
|All District(admin) route define here
|
*/


//district all 
Route::get('/adminManageDistrict',[DistrictController::class,'index']);
Route::get('/adminAddDistrict',[DistrictController::class,'addDistrict']);
Route::post('/districtAdd', [DistrictController::class,'addall']);
Route::get('/adminShowDistrict', [DistrictController::class,'districtShow']);
Route::get('/adminUpdateDistrict/{id}',[DistrictController::class,'districtUpdate'] );
Route::post('/adminEditedDistrict/{id}',[DistrictController::class,'districtEdited']);
Route::get('/adminDeleteDistrict/{id}',[DistrictController::class,'districtDelete']);






/*
|--------------------------------------------------------------------------
| login(admin) routes
|--------------------------------------------------------------------------
|All login(admin) route define here
|
*/





/*
/*
|--------------------------------------------------------------------------
| admin(slider) routes
|--------------------------------------------------------------------------
|All admin(slider) route define here
|
*/
Route::get('/adminManageSlider',[SlideController::class,'indexs']);
Route::post('/adminManageSlider',[SlideController::class,'indexs']);
Route::get('/adminAddSlider',[SlideController::class,'adminAddSlider']);
Route::post('/adminAddSlider',[SlideController::class,'adminAddSlider']);
Route::get('/adminShowSlider',[SlideController::class,'adminShowSlider']);
Route::get('/adminEditedSlider/{id}',[SlideController::class,'slidesView']);
Route::post('/slidesEdit/{id}',[SlideController::class,'slidesEdit'] );
Route::get('/adminDeleteSlider/{id}',[SlideController::class,'sliderDelete']);
Route::post('/slidesAddToDatabase',[SlideController::class,'slidesAddToDatabase']);








Route::post('cart',[CartController::class,'store']);
Route::get('/cartAdd',[CartController::class,'showCart'] )->name('cart');
Route::post('cartUpdate/{id}',[CartController::class,'update'] );
Route::post('cartDelete/{id}',[CartController::class,'delete'] );




Route::get('/dash',[DashController::class,'dashboar'] )->name('dash');
Route::get('/profileShow',[ProfileController::class,'profile'] );
Route::post('/profileEdited/{id}',[ProfileController::class,'profileEdited']);


Route::get('/allOrder',[OrderController::class,'latestOrder'] )->name('order');
Route::get('/adminDelivaryOrder',[OrderController::class,'adminDelivaryOrder'] );





Route::post('adminOrderDelivaryId/{id}',[OrderController::class,'adminOrderDelivaryId'] );
Route::post('adminOrderDelivaryIp/{id}',[OrderController::class,'adminOrderDelivaryIp'] );



Route::post('/adminThisUserOrder/{id}',[OrderController::class,'adminThisUserOrder'] );
Route::post('/adminThisUserOrderIp/{id}',[OrderController::class,'adminThisUserOrderIp'] );
Route::get('/adminManageOrder',[OrderController::class,'index'] );
Route::post('adminConfermOrder/{id}',[OrderController::class,'adminConfermOrder'] );
Route::get('/adminShowOrder',[OrderController::class,'showOrder'] );
Route::get('/adminViewOrder/{id}',[OrderController::class,'orderView'] );
Route::post('/ordershow/{id}',[OrderController::class,'orderShow'] );
Route::get('/ordershow/{id}',[OrderController::class,'orderShow'] );
Route::get('/orderDelete/{id}',[OrderController::class,'orderDelete']);



Route::get('/confermOrder',[UserOrderController::class,'confermOrder']);

Route::post('/confermOrderSave',[UserOrderController::class,'confermOrderSave']);

Route::get('/data',[UserOrderController::class,'data']);




Route::post('/slidesAdd',[SlideController::class,'slidesAdd'] );

Route::get('/s', [SlideController::class,'index']);






/*
|--------------------------------------------------------------------------
| catagory routes
|--------------------------------------------------------------------------
|All catagory route define here
|
*/

Route::get('/allCatagory',[CatagoryController::class,'allCatagory']);
Route::post('/allProduct/{name}',[CatagoryController::class,'showAllProductByCatagory'] );




Route::post('review/{id}',[ReviewController::class,'review']);
Route::post('addReview/{id}',[ReviewController::class,'addReview'] );







/*
|--------------------------------------------------------------------------
| Pdf routes
|--------------------------------------------------------------------------
|All catagory route define here
|
*/



/*
|--------------------------------------------------------------------------
| Pdf routes
|--------------------------------------------------------------------------
|All catagory route define here
|
*/




























































































































































































































