<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Privilege extends Model
{
    use HasFactory;
    public $timestamps = false;

    protected $fillable = [
        'description',
        'last_update'
    ];

    public function role()
    {
        return $this->belongsToMany(Role::class, 'role_privilege');
    }
}
