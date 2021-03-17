      
                 @extends('include.footer2')

                  
                 @extends('layouts.adminApp')
                 
                 @section('content')
             <div class="container" align="center">
             	<div class="row">
             		<h5 style="margin-left: 520px">Add District</h5>
             	<div class="col-md-12">
            
             
            <form method="post"  action="{{url('/adminCatagorySave')}}" enctype="multipart/form-data">
                @csrf
            <div class="card-body">
                
                <div class="form-group">
                    <label>name</label>
                    <input type="text" class="form-control" name="name" id="name"/>
                </div>
                <div class="form-group">
                    <label>description</label>
                    <input type="text" class="form-control" name="description" id="description"/>
                </div>
                <div class="form-group">
                    <label>image</label>
                    <input type="file" class="form-control" name="file" id="file"/>
                </div>
                

                <div class="form-group" >
                    <button name="add" type="submit" class="form-control  btn btn-danger"> <i class="fas fa-cart-plus"></i >ADD</button>
                </div>
            </div>
            </form>
        </div>
    </div>
    </div>
    </div>
    </div>
            @endsection

        
            