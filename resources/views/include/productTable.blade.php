
<br>
    <br>
<div class="container" align="center">
    <br>
    <br>
    <img class="container" align="center" width="1110" height="220" src="{{asset('front-end/Image1582787713.jpg')}}">
<br>
    <br>
    <table class="table table-bordered table-hover table-striped">
            <tr align="center">
          
                <th align="center">    PRODUCT id</th>
                <th align="center">TITLE</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
       

            @foreach( $product ?? '' as $row)
            <tr align="center" >
                <td>{{$row->id}}</td>
                <td>{{$row->title}}</td>
             
                
                
                <td><a href="{{ url ('/adminProductView/'.$row->id) }}" class="btn  btn-info">Edit</a>

                  <form method="post"  action="{{ url ('/productdelete/'.$row->id) }}" >
            {{ csrf_field() }}  
             
           <button type="submit" class="btn btn-info">Delete</button>
        
      </form>
                
      </div>
    </div>

  </div>
</div>
                </td>
            </tr>

           
            @endforeach
      
        </table>
    

</div>

  @extends('layouts.app')