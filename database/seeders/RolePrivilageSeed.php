<?php

namespace Database\Seeders;

use App\Models\Role;
use Illuminate\Database\Seeder;

class RolePrivilageSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $admin = Role::where('description', 'admin')->first();
        $admin->privileges()->attach([1, 2, 3, 4, 5, 6]);

        $staff = Role::where('description', 'author')->first();
        $staff->privileges()->attach([1, 2, 3, 4]);
    }
}
