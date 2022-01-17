<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="{{ asset('img/logo/logo.png');}}" rel="icon">
  <title>SSO - Login</title>
  <link href="{{ asset('file/vendor/fontawesome-free/css/all.min.css');}}" rel="stylesheet" type="text/css">
  <link href="{{ asset('file/vendor/bootstrap/css/bootstrap.min.css');}}" rel="stylesheet" type="text/css">
  <link href="{{ asset('file/css/ruang-admin.min.css');}}" rel="stylesheet">

</head>

<body class="bg-gradient-login">
  <!-- Login Content -->
  <div class="container-login">
    <div class="row justify-content-center">
      <div class="col-xl-6 col-lg-12 col-md-9">
        <div class="card shadow-sm my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-lg-12">
                <div class="login-form">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Login</h1>
                  </div>
                  @if (session()->has('login_error'))
                    <div class="alert alert-danger"> {{ session('login_error')}}</div>
                  @endif
                  <form class="user" action="{{ route('login')}}" method="POST">
                    @csrf
                      @if (session()->has('info'))
                        <div class="alert alert-success"> {{ session('info')}}</div>
                      @endif
                    <div class="form-group">
                      <input type="email" name="email" class="form-control @error('email') is-invalid @enderror" value="{{ old('email') }}"
                        placeholder="Enter Email Address">
                       @error('email')
                            <div class="invalid-feedback">{{$message}}</div>
                       @enderror
                    </div>
                    <div class="form-group">
                      <input type="password" name="password" class="form-control"  placeholder="Password">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small" style="line-height: 1.5rem;">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">Remember
                          Me</label>
                      </div>
                    </div>
                    <div class="form-group">
                      <button type="submit" class="btn btn-primary btn-block">Login</a>
                    </div>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="font-weight-bold small" href="{{url('/')}}">Back to home</a>
                  </div>
                  <div class="text-center">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Login Content -->
  <script src="{{ asset('vendor/jquery/jquery.min.js');}}"></script>
  <script src="{{ asset('vendor/bootstrap/js/bootstrap.bundle.min.js');}}"></script>
  <script src="{{ asset('vendor/jquery-easing/jquery.easing.min.js');}}"></script>
  <script src="{{ asset('js/ruang-admin.min.js');}}"></script>
</body>

</html>
