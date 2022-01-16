 @extends('template.admin')

@section('container')
   <div class="container" id="container-wrapper">
   	<div class="d-sm-flex align-items-center justify-content-between mb-4">
   		<h1 class="h3 mb-0 text-gray-800">HHAHA</h1>

   	</div>

   	<!-- Row -->
   	<div class="row">
   		<!-- Datatables -->
   		<div class="col-lg-12">
            <div class="from-group mb-2">
   				<button class="btn btn-primary" id="creatData" value="new">Tambah Data</button>
   			</div>
   			<div class="card mb-4">
   				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
   					<!-- <h6 class="m-0 font-weight-bold text-primary">DataTables</h6> -->
   				</div>
   				<div class="table-responsive p-3">
   					<table class="table align-items-center table-flush" id="dataTable">
   						<thead class="thead-light">
   							<tr>
   								<th>#</th>
   								<th>Description</th>
   							</tr>
   						</thead>
   						<tfoot>
   							<tr>
   								<th>#</th>
   								<th>Description</th>
   							</tr>
   						</tfoot>
   						<tbody>
                               <tr>
   								<td>#</td>
   								<td>Nip</td>
   							</tr>
   						</tbody>
   					</table>
   				</div>
   			</div>
   		</div>


   	</div>



   </div>
   <!-- Modal -->
   <div class="modal fade" id="modal-kota" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
   	<div class="modal-dialog" role="document">
   		<div class="modal-content">
   			<div class="modal-header">
   				<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
   				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
   					<span aria-hidden="true">&times;</span>
   				</button>
   			</div>
   			<div class="modal-body">
   				<form action="" name="form-kota" id="form-kota" enctype="multipart/form-data">
   					<div class="form-group">
   						<label for="">Nama Kota</label>
   						<input type="hidden" class="form-control" name="id_kota"></label>
   						<input type="text" class="form-control" name="nama_kota"></label>
   					</div>

   				</form>

   			</div>
   			<div class="modal-footer">
   				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
   				<button type="button" class="btn btn-primary btn-save">Save changes</button>
   			</div>
   		</div>
   	</div>
   </div>

   <script>
   	let table;
   	$(document).ready(function() {
   		// $('#dataTable').DataTable(); // ID From dataTable
   		table = $('#dataTable').DataTable();
   	});

    $('#creatData').click(function() {

   		$('#modal-kota').modal('show');
   		$('.btn-save').val('tambah');
   		$('.modal-title').html('Menambah Data Kota');
   		$('#form-kota')[0].reset();
   		$("input[type=hidden]").val('');
   	});

   </script>

@endsection
