<?php
use App\cart;
?>

<br>
    <br>
<div class="container" align="center">
    <br>
    <br>
    <img class="container" align="center" width="1110" height="220" src="{{asset('front-end/Image1582787713.jpg')}}">
<br>
    <br>
    <div>
      <p style="font-size:50px">
        Your cart
      </p>
    </div>
    <table class="table table-bordered table-hover table-striped">
      <thead>
            <tr align="center">
          
                <th align="center">   No </th>
                <th align="center">Product Title</th>
                <th>Product Quantity</th>
                <th>Unit price</th>
                <th>Total price</th>
                <th>
                 Action
                </th>
            </tr>
       

      </thead>
    
     <tbody>
              
       @foreach( $carts  as $row)
      
 <tr>
          <td> {{$loop->index +1}}</td>
           <td> {{$row->product->title}}
                 
           </td>
          <td> 
              <form class="form-inline" action="{{url('cartUpdate/'.$row->id)}}"  method="post">
                    @csrf
                    <input type="number" name="product_quantity" value="{{ $row->product_quantity }}"   class="form-control"> 
                    <button type="submit" class="btn btn-info">Update</button>
                  </form>

          </td>
          <td> {{$row->product->price}} </td>
           <td> 
          
           {{ $row->product->price * $row->product_quantity }}  </td>
          
           
           <td> 
              <form class="form-inline" action="{{url('cartDelete/'.$row->id)}}"  method="post">
                    @csrf
                    <input type="hidden" id="cart_id"> 
                    <button type="submit" class="btn btn-info" >Delete</button>
                  </form>

          </td>


         

 

        </tr>



                 
                
       
        
        @endforeach
     
         
        <tr>
          <td colspan="3"></td>
          <td> Total amount</td>
           <td> {{App\Models\product::cart()}}</td>
        </tr>
        
      </tbody>
        </table>
        
       
    <div class="float-right" >
      <a href="{{url('/product')}}" class="btn btn-info btn-lh ">Continue shoping</a>
      <a href="{{url('/confermOrder')}}" class="btn btn-info btn-lh ">Conferm Order</a>
    </div>
    

<br>
    <br>
    <div>
      <p align="center" style="font-size:50px">
        Your order
      </p>
    </div>
    <table class="table table-bordered table-hover table-striped" style="margin-right: 100px">
      <thead>
            <tr align="center">
          
                <th align="center">   No </th>
                <th align="center">Product Title</th>
                <th>Product Quantity</th>
                <th>Unit price</th>
                <th>Total price</th>
                <th>
                 Action
                </th>
                 <th>
                 Review
                </th>
                <th>
                 Conferm By Admin
                </th>
            </tr>
       

      </thead>
    
     <tbody>
              
       @foreach( $order  as $row)
       @if($row->conferm == '0')
      
        <tr>
          <td> {{$loop->index +1}}</td>
           <td> {{$row->product->title}}
                 
           </td>
          <td> {{ $row->product_quantity }}
                        </td>
          <td> {{$row->product->price}} </td>
           <td> 
          
           {{ $row->product->price * $row->product_quantity }}  </td>
          
           
           <td> 
              <form class="form-inline" action="{{url('cartDelete/'.$row->id)}}"  method="post">
                    @csrf
                    <input type="hidden" id="cart_id"> 
                    <button type="submit" class="btn btn-info" >Delete</button>
                  </form>

          </td>


          <td> 
   
      <form class="form-inline" action="{{url('review/'.$row->product->id)}}"  method="post">
                    @csrf
                   
                   
                  @if($row->order_id)
                 <button type="button" class="btn btn-info ">Reviewed</button>
                  @else
                  <button type="submit" class="btn btn-warning ">Review</button>
                  @endif
                
                  </form>
          </td>
          <td>
             
                 <button type="button" class="btn btn-info ">no</button>
                  
                 
          </td>

 

        </tr>
        @elseIf($row->conferm == '1')

        <tr>
          <td> {{$loop->index +1}}</td>
           <td> {{$row->product->title}}
                 
           </td>
          <td> {{ $row->product_quantity }}
                        </td>
          <td> {{$row->product->price}} </td>
           <td> 
          
           {{ $row->product->price * $row->product_quantity }}  </td>
          
           
           <td> 
              <form class="form-inline" action="{{url('cartDelete/'.$row->id)}}"  method="post">
                    @csrf
                    <input type="hidden" id="cart_id"> 
                    <button type="submit" class="btn btn-info" >Delete</button>
                  </form>

          </td>


          <td> 
   
      <form class="form-inline" action="{{url('review/'.$row->product->id)}}"  method="post">
                    @csrf
                   
                   
                  @if($row->order_id)
                 <button type="button" class="btn btn-info ">Reviewed</button>
                  @else
                  <button type="submit" class="btn btn-warning ">Review</button>
                  @endif
                
                  </form>
          </td>
          <td>
             
                 <button type="button" class="btn btn-info ">conferm</button>
                 
          </td>

 

        </tr>
        @else
        @endif
       @endforeach
     
         
        <tr>
          <td colspan="5"></td>
          <td> </td>
          
          <td>Total amount</td>
           <td> {{App\Models\product::total()}}</td>
        </tr>
        
      </tbody>
        </table>
</div>