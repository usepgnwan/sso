@extends('template.admin')

@section('container')
    <div class="container-fluid" id="container-wrapper">
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">menu</h1>

        </div>
        <div class="tes">

        </div>
        <!-- Row -->
        <div class="row" id="nestable2">
            <div class="dd col-md-12" style="height: 100% !important;">
                <div class="card mb-4">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-md-12 ccccc">

                                <select class="cst-select2" data-width="100%" name="user[]" id="cst-select2">
                                    @foreach ($levelaccess as $v)
                                        <option value="{{ $v['id'] }}">{{ $v['description'] }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="card-body">
                        <div class="dd" id="nestable">

                        </div>
                    </div>
                    <hr>
                    <div class="card-footer">
                        <div class=" float-right">
                            <form id="form-menu">
                                <input type="hidden" name="output" id="output">
                                <button class="btn btn-primary">Save</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            }
        });
        $('.cst-select2').change(function(e) {
            let id = $(this).val();
            $('[name="email"]').prop('readonly', true);
            url = "{{ route('dashboard.list_menu', ['id' => ':id']) }}";
            url = url.replace(":id", id);
            $.ajax({
                url: url,
                method: 'GET',
                success: function(data) {
                    $('#nestable').html(data);  
                },
                complete: function(data) {  
                    $('#output').val(JSON.stringify($('#nestable').nestable('serialize')));
                    console.log($('#nestable').nestable('serialize'))
                }
            });
        });
        $('.cst-select2').trigger('change');

        $("#form-menu").on( "submit", function( event ) {
            event.preventDefault();
            let form = new FormData($(this)[0]);
            let url = "{{ route('dashboard.save_menu')}}";
            $.ajax({
                url: url,
                data: form,
                method: 'POST',
                processData: false,
                contentType: false,
                success: function (data) {
                    swal(data.msg, { icon: 'success' }).then(function () { });
                }
            });
        });
    </script>
@endsection
