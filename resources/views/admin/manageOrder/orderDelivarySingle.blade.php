
  @extends('include.footer2')
         
        
         @extends('layouts.adminApp')
            @section('content')
<br>
    <br>
<div class="container" align="center">
    <br>
    <br>
    <img class="container" align="center" width="1110" height="220" src="{{asset('front-end/Image1582787713.jpg')}}">
<br>
    <br>
    
    <table class="table table-bordered table-hover table-striped">
      <thead>
            <tr align="center">
          
                <th align="center">   No </th>
                <th align="center">Product Id</th>
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
       
       @foreach( $order  as $row)
        <tr>
          <td> {{$loop->index +1}}</td>
          <td> {{$row->product->id}}
                 
           </td>
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
          <td> {{ $total_price}}</td>
        </tr>
      </tbody>
        </table>
        
     
     <h1 style="margin-left:100px">Transport to: {{$orders->name}}</h1>   
     <h2 style="margin-left:100px">Email: {{$orders->email}}</h2> 
     <h2 style="margin-left:100px">Phone: {{$orders->phone}}</h2> 
     <h2 style="margin-left:100px">payment: {{$orders->payment}}</h2> 
     <h2 style="margin-left:100px">Address: {{$orders->address}}</h2>
    <div>
      
    </div>
    </div>

            @endsection

