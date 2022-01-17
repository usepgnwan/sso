<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SSO</title>

    <link href="{{ asset('file/vendor/fontawesome-free/css/all.min.css'); }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('file/bootstrap/css/bootstrap.min.css'); }}" rel="stylesheet" type="text/css" />


    <script src="{{ asset('file/bootstrap/js/jquery.min.js'); }}"></script>
    <script src="{{ asset('file/bootstrap/js/bootstrap.min.js'); }}"></script>


</head>

<body>
    <!-- Nav -->
    @include('blog_layout.nav')
    <!-- Penutup NAV -->
    <div class="container">
        @yield('container')
    </div>

</body>

</html>

