
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{url('/')}}">
        <div class="sidebar-brand-icon">
            <img src="{{asset('file/img/logo/logo2.png');}}" />
        </div>
        <div class="sidebar-brand-text mx-3">SSO TES</div>
    </a>

    <hr class="sidebar-divider my-0" />
    {{-- Menu dinamis dari middleware --}}
        {!! $global_menu['admin_menu'] !!}   
    {{-- <li class="nav-item  ">
        <a class="nav-link" href="{{ route('dashboard')}}">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>
    <hr class="sidebar-divider" />
    <div class="sidebar-heading">Features</div>
   @can('admin')
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBootstrap"
            aria-expanded="true" aria-controls="collapseBootstrap">
            <i class="far fa-fw fa-window-maximize"></i>
            <span>Data Master</span>
        </a>
        <div id="collapseBootstrap" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Data Master</h6>
                <a class="collapse-item" href="{{ route('dashboard.role') }}">Role</a>
                <a class="collapse-item" href="{{ route('dashboard.privilege') }}">Privilege</a>
                <a class="collapse-item" href="{{ route('dashboard.user') }}">User</a>
            </div>
        </div>
    </li>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseForm" aria-expanded="true"
            aria-controls="collapseForm">
            <i class="fab fa-fw fa-wpforms"></i>
            <span>Management Previlege</span>
        </a>
        <div id="collapseForm" class="collapse" aria-labelledby="headingForm" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Management Previlege</h6>
                <a class="collapse-item" href="{{ route('dashboard.roleprivilige') }}">Role Previlege</a>
                <div class="accordion" id="accordion1">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#tes" aria-expanded="true"
                    aria-controls="tes">
                    <i class="fab fa-fw fa-wpforms"></i>
                        <span>Management Previlege</span>
                    </a>
                    <div id="tes" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordion1">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Data Master</h6>
                            <a class="collapse-item" href="{{ route('dashboard.role') }}">Role</a>
                            <a class="collapse-item" href="{{ route('dashboard.privilege') }}">Privilege</a>
                            <a class="collapse-item" href="{{ route('dashboard.user') }}">User</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </li>
    @endcan

    <li class="nav-item">
        @can('view data')
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapspost" aria-expanded="true"
            aria-controls="collapseForm">
            <i class="fab fa-fw fa-wpforms"></i>
            <span>Post</span>
        </a>
        @endcan
        <div id="collapspost" class="collapse" aria-labelledby="headingForm" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Your Post</h6>
                <a class="collapse-item" href="{{ route('dashboard.blog') }}">Post</a>
                @can('admin')
                    <a class="collapse-item" href="{{ route('dashboard.blog.publish') }}">Post Publish</a>
                @endcan
            </div>
        </div>
    </li> --}}
