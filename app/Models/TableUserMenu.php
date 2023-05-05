<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TableUserMenu extends Model
{
    use HasFactory;
    protected $table = 'table_usermenu';
    protected $guarded = ['id'];
}
