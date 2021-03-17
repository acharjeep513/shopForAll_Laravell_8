  @extends('include.footer2')
                 
         @extends('layouts.app')


          @section('content')

<br>
    <br>
<div class="container" align="center">
    <br>
    <br>
    <img class="container" align="center" width="1110" height="220" src="{{asset('front-end/Image1582787713.jpg')}}">
<br>
    <br>
    <h4></h4>
    <table class="table table-bordered table-hover table-striped">
      <thead>
            <tr align="center">
          
                <th align="center">   No </th>
                <th align="center">Product Title</th>
                <th>Product Quantity</th>
                <th>Unit price</th>
                <th>Total price</th>
               
            </tr>
       

      </thead>
      <tbody>
      
       @foreach( $carts  as $row)
        <tr>
          <td> {{$loop->index +1}}</td>
           <td> {{$row->product->title}}
                 
           </td>
          <td> {{ $row->product_quantity }}
              

          </td>
          <td> {{$row->product->price}} </td>
           <td> 
           @php
             if($loop->index == 0){
             $total_price =0;
            
           }
             $total_price += $row->product->price * $row->product_quantity;

          @endphp
           {{ $row->product->price * $row->product_quantity }}  </td>
          
           
             

    

 

        </tr>
       
              
        @endforeach
        
        <tr>
          <td colspan="3"></td>
          <td> Total amount</td>
          <td>{{App\Models\product::total()}}</td>
        </tr>
      </tbody>
        </table>          
    </div>
    </div>
 <form method="post"  action="{{url('/confermOrderSave')}}" enctype="multipart/form-data">
                @csrf 
           
            <div class="card-body" style="margin: 200px">
                
                <div class="form-group">
                    <label>name</label>
                    <input type="text" class="form-control" name="name" id="name"/>
                </div>
                <div class="form-group">
                    <label>email</label>
                    <input type="text" class="form-control" name="email" id="email"/>
                </div>
                <div class="form-group">
                    <label>phone</label>
                    <input type="text" class="form-control" name="phone" id="phone"/>
                </div>
                
                 <div class="form-group">
                 <label>Payment</label>
                               <select class="form-control" name="payment" id="phone">
                                   <option>
                                       Please select your payment status
                                   </option>
                                   
                                   <option> Cash on Delivery</option>
                               </select>
                            </div>
                <div class="form-group">
                    <label>address</label>
                    <input type="text" class="form-control" name="address" id="address"/>
                </div>       
                    
                  
               
                <div class="form-group" >
                    <button name="add" type="submit" class="form-control  btn btn-success" style="height: 60px;width: 925px;margin-top: 30px"> <i class="fas fa-cart-plus"></i >Conferm Order</button>
                </div>
            </div>
            </form>
        </div>
    </div>

            @endsection

