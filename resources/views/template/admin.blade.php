<!DOCTYPE html>
<html lang="en">

<head>

    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link href="{{ asset('file/img/logo/logo2.png')}}" rel="icon" />
    <title>SSO</title>
    <link href="{{ asset('file/vendor/fontawesome-free/css/all.min.css'); }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('file/vendor/bootstrap/css/bootstrap.min.css'); }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('file/css/ruang-admin.min.css') }}" rel="stylesheet" />

    <script src="{{ asset('file/vendor/jquery/jquery.min.js'); }}"></script>
    <script src="{{ asset('file/vendor/bootstrap/js/bootstrap.bundle.min.js'); }}"></script>
    <script src="{{ asset('file/vendor/jquery-easing/jquery.easing.min.js'); }}"></script>
    <!-- Page level plugins -->
    <script src="{{ asset('file/vendor/datatables/jquery.dataTables.min.js')}}"></script>
    <script src="{{ asset('file/vendor/datatables/dataTables.bootstrap4.min.js')}}"></script>

    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
        integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->

    <script src="{{ asset('file/vendor/sweatalert/sweetalert.min.js') }}"></script>

</head>

<body id="page-top">
    <div id="wrapper">
        <!-- Sidebar -->
        <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
        @include('partials.navbar')
        </ul>
        <!-- Sidebar -->
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <!-- TopBar -->

                @include('partials.topbar')
                <!-- Topbar -->

                <!-- Container Fluid-->

                <div class="container-fluid" id="container-wrapper">
                    @yield('container')
                </div>

                <!---Container Fluid-->
            </div>
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>copyright &copy;
                            <script>
                                document.write(new Date().getFullYear());
                            </script>

                        </span>
                    </div>
                </div>
            </footer>
            <!-- Footer -->
        </div>
    </div>

    <!-- Scroll to top -->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

</body>

    <script src="{{ asset('file/js/ruang-admin.min.js'); }}"></script>
    <script src="{{ asset('file/vendor/chart.js/Chart.min.js'); }}"></script>
</html>
