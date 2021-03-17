
<div style="background-color: green;height:70px;margin: 15px" align="center">
  <p style="font-size: 50px;color:white">ALL Deal</p>
</div>
<div class="row" style=" margin-left:20px">
@foreach( $product ?? '' as $row)
   
<div class="col-md-4" style="margin-bottom:20px">
<div class="card">
  <img src="{{asset('front-end/Image/'.$row->ProductImage->image)}}"  style="width:70%;height: 200px;margin-left: 50px">
  <div class="container">
  	<h4 style="margin-right:20px"><b>{{$row->title}}</b></h4>
     
    <form method="post"  action="{{url('/productSingle/'.$row->id)}}" >
    	@csrf
  <p><button class="btn btn-success" style="width: 350px">View</button></p>
    </form>
  </div>
</div>
</div>
 @endforeach
</div>

