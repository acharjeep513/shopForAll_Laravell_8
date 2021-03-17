@extends('include.footer2')

 @extends('layouts.adminApp')
 
                 @section('content')

     <div class="container"  align="center">
         Show Catagory
             </div>

<br>
               


<div class="row">

<br>
    <br>
    <div class="col-md-12">
<div class="container" align="center">
    <table class="table table-bordered table-hover table-striped">
            <tr align="center">
                <th align="center">    # </th>
                <th align="center">Catagory name</th>
                <th align="center">Catagory Description</th>
                <th align="center">Image</th>                
            </tr>
       


            @foreach( $catagory ?? '' as $catagory)
            <tr align="center" >
                <td>{{$loop->index + 1}}</td>
                <td>{{$catagory->name}}</td>
                <td>{{$catagory->description}}</td>
                <td>{{asset('storage/app/'.$catagory->image)}}
                    <img src="{{asset(asset('storage/'.$catagory->image))}}"></td>
            </tr>

           
            @endforeach
      
      
        </table>
    

</div>
</div>
</div>

      
    
            @endsection