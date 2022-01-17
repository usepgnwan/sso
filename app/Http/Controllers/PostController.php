<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;

class PostController extends Controller
{
    protected $post;
    public function __construct(Post $post)
    {
        $this->post = $post;
        $this->middleware('auth')->except('blog', 'detail');
    }
    public function blog(Request $request)
    {
        $post = $this->post->where('publish', true)->filter($request->search)->latest()->paginate(9)->withQueryString();
        // return response()->json($post);
        // die;
        return view('blog_layout.content', compact('post'));
    }

    public function detail(Post $post)
    {
        // return response()->json($post);
        $posts = $post;
        return view('blog_layout.blog_detail', compact('posts'));
    }
}
