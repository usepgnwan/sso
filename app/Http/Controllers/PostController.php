<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

class PostController extends Controller
{
    protected $post;
    public function __construct(Post $post)
    {
        $this->post = $post;
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

    public function index(Request $request, $opt = null)
    {
        $post = [];
        if (Gate::check('admin')) {
            $post = $this->post->where('publish', false)->latest()->get();
        } elseif (Gate::check('author')) {
            $post = $this->post->where('user_id', auth()->user()->id)->latest()->get();
        };

        $title = 'Data Post';
        if ($request->ajax() && $opt == 'data') {
            return DataTables::of($post)
                ->addIndexColumn()
                ->addColumn('status_publish', function ($row) {
                    $status = '';
                    if (!$row->publish) {
                        $status = 'Menunggu Approve Pubish';
                    } else {
                        $time = Carbon::parse($row->published_at)->diffForHumans();
                        $status = '<span class="badge badge-success">Berhasil Publish, ' . $time . '</span> ';
                    }
                    return $status;
                })
                ->addColumn('images', function ($row) {
                    return '<img src="' . asset('images/post') . '/' . $row->image . '" width="50">';
                })
                ->addColumn('action', function ($row) {
                    $btn =  '';
                    if (Gate::check('admin')) {
                        $btn = '<a href="javascript:void(0)" class="btn btn-primary btn-sm edit-data " title="lihat detail privilege"  data-id="' . $row->id . '">Approve Publish</a>';
                    } elseif (Gate::check('author')) {
                        $btn = '-';
                    }
                    return $btn;
                })
                ->addColumn('created_at', function ($row) {
                    return Carbon::parse($row->created_at)->diffForHumans();
                })
                ->rawColumns(['created_at', 'action', 'status_publish', 'images'])
                ->make(true);
        }
        // return response()->json($data);

        return view('layouts.post_dashboard', compact('post', 'title'));
    }

    public function publish_post(Request $request)
    {

        $post = $this->post->where('publish', true)->latest()->get();


        $title = 'Data Post Publish';
        if ($request->ajax()) {
            return DataTables::of($post)
                ->addIndexColumn()
                ->addColumn('status_publish', function ($row) {
                    $status = '';
                    if (!$row->publish) {
                        $status = 'Menunggu Approve Pubish';
                    } else {
                        $time = Carbon::parse($row->published_at)->diffForHumans();
                        $status = '<span class="badge badge-success">Berhasil Publish, ' . $time . '</span> ';
                    }
                    return $status;
                })
                ->addColumn('images', function ($row) {
                    return '<img src="' . asset('images/post') . '/' . $row->image . '" width="50">';
                })
                ->addColumn('created_at', function ($row) {
                    return Carbon::parse($row->created_at)->diffForHumans();
                })
                ->rawColumns(['created_at', 'action', 'status_publish', 'images'])
                ->make(true);
        }
        // return response()->json($data);

        return view('layouts.post_publish', compact('post', 'title'));
    }


    public function update(Request $request, $id)
    {

        $check = $this->post->find($id);


        if ($check) {
            $data = [
                'publish' => true,
                'published_at' => now()
            ];
            $check->fill($data)->save();;

            return response()->json(['status' => true, 'msg' => 'Post Berhasil diapprove ', 'data' =>  $check], Response::HTTP_OK);
        }

        return response()->json(['status' => false, 'msg' => 'Post tidak ditemukan', 'data' => []], Response::HTTP_NOT_FOUND);
    }


    public function store(Request $request)
    {

        $valid = Validator::make($request->all(), [
            'title' => 'required|max:225|unique:posts,title,',
            'body' => 'required|max:225',
        ]);
        if ($valid->fails()) {
            // return response()->json(['status' => false, 'msg' => $valid->getMessageBag()->toArray()]);
            return response()->json(['status' => false, 'msg' => $valid->errors()]);
        }
        $imgName = null;

        $check = $this->post->find($request->id_post);
        if ($check) {
            $imgName = $check->image;
            if ($request->hasFile('image') && $request->image != '') {
                $path_old = public_path('images/post/') . $check->image;
                if (file_exists($path_old) && $check->image != null) {
                    unlink($path_old);
                }
                $image = $request->file('image');
                $imgName = $image->hashName();
                $image->move('images/post', $imgName);
            }
        } else {
            if ($request->hasFile('image') && $request->image != '') {
                $image = $request->file('image');
                $imgName = $image->hashName();
                $image->move('images/post', $imgName);
            }
        }

        $data = [
            'title' => $request->title,
            'slug' => $request->title,
            'body' => $request->body,
            'user_id' => auth()->user()->id,
            'publish' => false,
            'published_at' => now(),
            'image' => $imgName
        ];
        $this->post->create($data);
        return response()->json(['status' => true, 'msg' => 'berhasil tambah data']);
    }
}
