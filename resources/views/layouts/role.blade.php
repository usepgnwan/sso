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
                                <th>Last Update</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>#</th>
                                <th>Description</th>
                                <th>Last Update</th>
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
                    <div class="form-group">
                        <label for="">Description Role</label>
                        <input type="hidden" class="form-control" name="id_role"></label>
                        <input type="text" class="form-control" name="description_role"></label>
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
        console.log('hahaa')
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            }
        });
        // $('#dataTable').DataTable(); // ID From dataTable
        table = $('#dataTable').DataTable({
            prossecing: true,
            serverSide: true,
            ajax: "{{ route('dashboard.role',['opt'=>'data'])}}",
            columns: [
                { data: 'DT_RowIndex', name: 'DT_RowIndex' },
                { data: 'description', name: 'description' },
                { data: 'last_update', name: 'last_update' },
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
        url = "{{ route('role.show', ['role'=>':id'])}}";
        url = url.replace(":id", id);
        $('#modal-data').modal('show');
        $('.btn-save').val('edit');
        $('.modal-title').html('Edit Data Role');
        $('#form-data')[0].reset();
        $("input[type=hidden]").val('');
        $.ajax({
            url: url,
            method: 'GET',
            success: function (data) {
                if (data.status) {
                    $('[name="id_role"]').val(data.data.id);
                    $('[name="description_role"]').val(data.data.description);
                } else if (!data.status) {
                    swal(data.msg, { icon: 'error' });
                }
            }
        });

    });
    $('body').on('click', '.delete-data', function (e) {
        let id = $(this).data('id');
        url = "{{ route('role.destroy', ['role'=>':id'])}}";
        url = url.replace(":id", id);

        swal({
            title: 'Yakin',
            text: 'Hapus Data',
            buttons: true,
            icon: 'warning'
        }).then((ok) => {
            if (ok) {
                $.ajax({
                    url: url,
                    method: 'DELETE',
                    success: function (data) {
                        if (data.status) {
                            swal(data.msg, { icon: 'success' }).then(function () {
                                table.draw();
                            })
                        } else if (!data.status) {
                            swal(data.msg, { icon: 'error' }).then(function () {
                                table.draw();
                            })
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
        let url = '';
        let msg = '';
        let method = '';
        if (check == 'add') {
            msg = 'Berhasil Simpan Data';
            url = "{{ route('role.store') }}";
        } else {
            let id = $('[name="id_role"]').val();
            msg = 'Berhasil Edit Data';
            url = "{{ route('role.update',['role'=>':id']) }}";
            form.append("_method", "PUT");
            url = url.replace(':id', id);
        }
        $.ajax({
            url: url,
            data: form,
            method: 'POST',
            processData: false,
            contentType: false,
            success: function (data) {
                if (!data.status) {
                    $(".text-error-description_role").remove();
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
