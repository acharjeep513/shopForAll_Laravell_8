
                 @extends('include.footer2')
         
        
        @extends('layouts.adminApp')
            @section('content')
            
    
<div class="row" style="margin-left:150px">

<br>
    <br>
<div class="col-md-5" style="border: 2px solid black;margin-right:10px">
    <h1 style="margin-left:150px">USER ID</h1>
 <div class="container" align="center">
    @foreach( $latestOrderUser ?? '' as $row)
    <div class="row" style="margin: 10px">

        <div class="col-md-1" style="font-size:30px;">
       {{$loop->index +1}}
        </div>
               <form class="form-inline" action="{{url('adminThisUserOrder/'.$row->userOrder_id)}}"  method="post">
                    @csrf
                <div class="col-md-4">
                  <button type="submit" name="id" id="id" class="btn btn-success" style="width: 300px" value="{{$row->userOrder_id}}">Orders</button>  
                  </div>
                  </form>
        
    </div>
     @endforeach
 </div>
</div>
<div class="col-md-5" style="border: 2px solid black">
    <h1 style="margin-left:150px">USER IP</h1>
 <div class="container" align="center">
    @foreach( $latestOrderIp ?? '' as $row)
    <div class="row" style="margin: 10px">
        <div class="col-md-1" style="font-size:30px;">
       {{$loop->index +1}}
        </div>
        <form class="form-inline" action="{{url('adminThisUserOrderIp/'.$row->userOrder_ip)}}"  method="post">
                    @csrf
                <div class="col-md-4">
                  <button type="submit" name="id" id="id" class="btn btn-success" style="width: 300px" value="{{$row->userOrder_ip}}">Orders</button>  
                  </div>
                  </form>
    </div>
     @endforeach
 </div>
</div>
<script type="text/javascript">
    
    
</script>



<script src="{{asset('js/jquery-3.4.1.js')}}"> </script>
<script src="{{asset('js/bootstrap.bundle.min.js')}}"> </script>

<script src="{{asset('js/bootstrap.js')}}"> </script>


            @endsection

