<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TableAcessUserMenu extends Model
{
    use HasFactory;
    protected $table = 'table_access_menu';
    protected $guarded = ['id'];
}
