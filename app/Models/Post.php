<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    protected $guarded = ['id'];
    protected $with = ['user:id,name'];


    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function scopeFilter($query, $search)
    {
        $query->when($search ?? false, function ($query) use ($search) {
            $query->whereHas('user', function ($query)  use ($search) {
                $query->where('name', 'like', '%' . $search . '%');
            })
                ->orWhere('title', 'like', '%' . $search . '%');;
        });
    }
}
