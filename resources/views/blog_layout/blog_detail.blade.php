@extends('template.blog')
@section('container')
                <div class="row">
                    <div class="col-md-12 mt-4">
                        <div class="card text-center">
                            <img src="{{  asset('images/post') .'/'. $posts->image }}"
                                class="card-img-top" alt="..." height="300">
                            <div class="card-body">
                                <h5 class="card-title"> {{  $posts->title}}</h5>
                                <small class="text-muted">Author: {{ $posts->user->name}} , {{ $posts->created_at->diffForHumans()}} </small>
                                <p class="card-text">  {{  $posts->body }} </p>
                                    </div>
                        </div>
                    </div>
            </div>
@endsection
