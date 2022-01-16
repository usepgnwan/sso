<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $with = ['privileges'];
    protected $fillable = ['description', 'last_update'];


    public function privileges()
    {
        return $this->belongsToMany(Privilege::class, 'role_privilege');
    }


    public function scopeCheckPrivilege($query, $check)
    {
        return $query->whereHas('privileges', function ($query) use ($check) {
            $query->where('description', $check);
        }) ?: false;
    }
}
