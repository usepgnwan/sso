<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RolePrivilage extends Model
{
    use HasFactory;
    protected $table = 'role_privilege';
    public $timestamps = false;

    public function roles()
    {
        return $this->hasMany(Role::class, 'id');
    }

    public function privileges()
    {
        return $this->hasMany(Privilege::class, 'id');
    }
}
