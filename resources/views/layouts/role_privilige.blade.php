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
                <button class="btn btn-primary" id="creatData" value="new">Tambah Privilege</button>
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
                                <th>Role</th>
                                <th>Privilige</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>#</th>
                                <th>Role</th>
                                <th>Privilige</th>
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
                <h5 class="modal-title1" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" name="form-data" id="form-data" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="">Role</label>
                        <select name="role" id="role" class="cst-select2">
                            <option value="0">- Pilih -</option>
                            @foreach ($role as $r)
                            <option value="{{$r->id}}">{{$r->description}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">Privilege</label>
                        <select name="privilege[]" id="privilege" class="cst-select2 form-control"
                             multiple>
                            @foreach ($privilege as $p)
                            {{-- <option data-tokens="{{$p->id}}">{{$p->description}}</option> --}}
                            <option value="{{$p->id}}">{{$p->description}}</option>
                            @endforeach
                        </select>
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

<div class="modal fade" id="modal-detail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="">Role</label>
                     <input type="text" name="role_detail" class="form-control" id="role_detail" readonly>
                </div>
                <div class="mb-4">
                    <div class="table-responsive p-3">
                        <table class="table align-items-center table-flush" id="dataTable">
                            <thead class="thead-light">
                                <tr>
                                    <th>#</th>
                                    <th>Privilige</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>#</th>
                                    <th>Privilige</th>
                                    <th>Action</th>
                                </tr>
                            </tfoot>
                            <tbody id="body-privilege">
                            </tbody>
                        </table>

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script>
    
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
                ajax: "{{ route('dashboard.roleprivilige',['opt'=>'data'])}}",
                columns: [
                    { data: 'DT_RowIndex', name: 'DT_RowIndex' },
                    { data: 'description', name: 'description' },
                    { data: 'roleprivilige', name: 'roleprivilige' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ]
            });

            $('.selectpicker').selectpicker();
        });

        $('#creatData').click(function () {

            $('#modal-data').modal('show');
            $('.btn-save').val('add');
            $('.modal-title').html('Menambah Privilege Ke Role');
            $('#form-data')[0].reset();
            $("input[type=hidden]").val('');
            $('.selectpicker').selectpicker('refresh');
        });

        $('body').on('click', '.edit-data', function (e) {

            let id = $(this).data('id');
            url = "{{ route('role.show', ['role'=>':id'])}}";
            url = url.replace(":id", id);
            $('#modal-detail').modal('show');

            $("input[type=hidden]").val('');
            $.ajax({
                url: url,
                method: 'GET',
                success: function (data) {
                    if (data.status) {
                        // $('[name="id_role"]').val(data.data.id);
                        $('[name="role_detail"]').val(data.data.description);
                        $('#body-privilege').html('');
                        $.each(data.data.privileges, function (i,result) {
                           $('#body-privilege').append(`
                                <tr>
                                    <td>${i+1}</td>
                                    <td>${result.description}</td>
                                    <td><a href="javascript:void(0)" class="btn btn-danger btn-sm delete-data" data-id-role="${data.data.id}" data-id-privilige="${result.id}">Hapus</a></td>
                                </tr>
                           `);
                        })
                    } else if (!data.status) {
                        swal(data.msg, { icon: 'error' });
                    }
                }
            });

        });
        $('body').on('click', '.delete-data', function (e) {
            let id_role = $(this).data('id-role');
            let id_privilige = $(this).data('id-privilige');
            url = "{{ route('privilige_management.delete_rp', ['id_role'=>':id_role', 'id_privilige'=>':id_privilige'])}}";
            url = url.replace(":id_role", id_role);
            url = url.replace(":id_privilige", id_privilige);
            $('#modal-data').modal('hide');
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
                                    $('#modal-detail').modal('hide');
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
                url = "{{ route('privilige-management.store') }}";
            }
            $.ajax({
                url: url,
                data: form,
                method: 'POST',
                processData: false,
                contentType: false,
                success: function (data) {
                    if (!data.status) {
                        $(".text-error-role").remove();
                        $(".text-error-privilege").remove();
                        $.each(data.data, function (field_name, error) {
                            $(document).find('#' + field_name).after('<span class="text-error-' + field_name + ' text-danger ">' + error + '</span>')
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
