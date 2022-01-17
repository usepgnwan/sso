@extends('template.blog')

@section('container')
        @if ($post->count())
            <div class="row justify-content-center mt-3">
                <div class="col-md-6">
                    <h3 class="text-center">All Post</h3>
                    <form action="">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" name="search" placeholder="Search Title" value="{{ request('search')}}">
                            <button type="submit" class="btn btn-primary" type="button" id="button-addon2">Search</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                @foreach ($post as $p )
                    <div class="col-md-4 mt-2">
                        <div class="card text-center">
                            <img src="{{  asset('images/post') .'/'. $p->image }}"
                                class="card-img-top" alt="..." height="300">
                            <div class="card-body">
                                <h5 class="card-title"> {{  $p->title}}</h5>
                                <small class="text-muted">Author: {{ $p->user->name}} , {{ $p->created_at->diffForHumans()}} </small>
                                <p class="card-text">  </p>
                                <a href="{{ route('blog', ['post' => $p->slug])}}" class="btn btn-primary">view Detail</a>
                            </div>
                        </div>
                    </div>
                @endforeach

            </div>
            <div class="row mt-3">
                <div class="col-md-12 d-flex justify-content-center" >
                     {{$post->links()}}
                </div>
            </div>
            @else
            <div class="row mt-3">
                <div class="col-md-12">
                    <div class=" text-center">
                         <h3>Post Tidak Tersedia</h3>
                    </div>
                </div>
            </div>
            @endif
@endsection
