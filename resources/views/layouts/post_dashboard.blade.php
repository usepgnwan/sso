{{-- @extends('template.admin')

@section('container') --}}
<div class="container-fluid" id="container-wrapper">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">{{$title}}</h1>

    </div>

    <!-- Row -->
    <div class="row">
        <!-- Datatables -->
        <div class="col-lg-12">
            {{-- @can('author') --}}
                <div class="from-group mb-2">
                    <button class="btn btn-primary" id="creatData" value="new">Tambah Data</button>
                </div>
            {{-- @endcan --}}
            <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <!-- <h6 class="m-0 font-weight-bold text-primary">DataTables</h6> -->
                </div>
                <div class="table-responsive p-3">
                    <table class="table align-items-center table-flush" id="dataTable">
                        <thead class="thead-light">
                            <tr>
                                <th>#</th>
                                <th>Title</th>
                                <th>Deskription</th>
                                <th>Tanggal Buat</th>
                                <th>Foto</th>
                                <th>Publisher</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>#</th>
                                <th>Title</th>
                                <th>Deskription</th>
                                <th>Tanggal Buat</th>
                                <th>Foto</th>
                                <th>Publisher</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </tfoot>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


    </div>



</div>
<!-- Modal -->
<div class="modal fade" id="modal-data" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" name="form-data" id="form-data" enctype="multipart/form-data">
                    @csrf
                    <div class="form-group">
                        <label for="">Title</label>
                        {{-- <input type=" " class="form-control" name="id" value="{{session()->get('user.id')}}"> --}}
                        <input type="text" class="form-control" name="title"  >
                    </div>
                    <div class="form-group">
                        <label for="">Body </label>
                        <textarea name="body" class="form-control" id="body" cols="30" rows="10"></textarea>
                        <div class="invalid-feedback" id="error-body"></div>
                    </div>

                    <div class="from-group">
                        <label for="">Image</label>
                        <input type="file" name="image" id="image"class="form-control" >
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
    // let table;
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            }
        });
        // $('#dataTable').DataTable(); // ID From dataTable
        table = $('#dataTable').DataTable({
            prossecing: true,
            serverSide: true,
            ajax: "{{ route('dashboard.blog',['opt'=>'data']);}}",
            columns: [
                { data: 'DT_RowIndex', name: 'DT_RowIndex' },
                { data: 'title', name: 'title' },
                { data: 'body', name: 'body' },
                { data: 'created_at', name: 'created_at' },
                { data: 'images', name: 'images' },
                { data: 'user.name', name: 'user.name' },
                { data: 'status_publish', name: 'status_publish' },
                { data: 'action', name: 'action', orderable: false, searchable: false }
            ]
        });
    });

    $('#creatData').click(function () {

        $('#modal-data').modal('show');
        $('.btn-save').val('add');
        $('.modal-title').html('Menambah Data Role');
        $('#form-data')[0].reset();
        $("input[type=hidden]").val('');
    });

    $('body').on('click', '.edit-data', function (e) {
        let id = $(this).data('id');
        url = "{{ route('post.update', ['post'=>':id'])}}";
        url = url.replace(":id", id);
       swal({
            title: 'Yakin',
            text: 'Publish Post',
            buttons: true,
            icon: 'warning'
        }).then((ok) => {
            if(ok){
            $.ajax({
                url: url,
                method: 'POST',
                data:{
                    _method:"PUT"
                },
                success: function (data) {
                    if (data.status) {
                      swal(data.msg, { icon: 'success' });  table.draw();
                    } else if (!data.status) {
                        swal(data.msg, { icon: 'error' });
                    }
                }
            });
            }
        });

    });
    $('.btn-save').click(function (e) {
        e.preventDefault();
        let form = new FormData($('[name="form-data"]')[0]);
        check = $(this).val();

       let msg = 'Berhasil Simpan Data';
       let  url = "{{ route('post.tambah') }}";

        $.ajax({
            url: url,
            data: form,
            method: 'POST',
            processData: false,
            contentType: false,
            success: function (data) {
                if (!data.status) {
                    $(".text-error-title").remove();
                    $(".text-error-body").remove();
                    $.each(data.data, function (field_name, error) {
                        $(document).find('[name=' + field_name + ']').after('<span class="text-error-' + field_name + ' text-danger ">' + error + '</span>')
                    })
                } else {
                    swal(msg, { icon: 'success' }).then(function () {
                        $('#modal-data').modal('hide');
                        $('#form-data')[0].reset();
                        $("input[type=hidden]").val('');
                        table.draw();
                    })
                }
            }
        });
    })
</script>

{{-- @endsection --}}
