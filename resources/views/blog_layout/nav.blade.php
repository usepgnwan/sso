 <nav class="navbar navbar-expand-lg navbar-dark bg-danger" style="background-color:blueviolet !important;">
        <div class="container ">
            <a class="navbar-brand" href="#">SSO</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link   " aria-current="page" href=" ">Home</a>
                    </li>
                </ul>
                <ul class="navbar-nav  ml-auto">
                   @auth
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         <span><i class="bi bi-person-circle"></i></span>   {{ auth()->user()->name}}
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="{{route('dashboard')}}">Dashboard</a>
                        <div class="dropdown-divider"></div>
                        <form action="{{route('logout')}}" method="POST">
                            @csrf
                            <button type="submit" class="dropdown-item" href="#">Logout</a>
                        </form>
                        </div>
                    </li>
                    @else

                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="{{ url('auth/login')}}"><i
                                class="bi bi-box-arrow-in-right"></i>
                            &nbsp;Login</a>
                    </li>
                   @endauth
                </ul>
            </div>
        </div>
    </nav>
