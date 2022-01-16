<?php

namespace Database\Seeders;

use App\Models\Role;
use Illuminate\Database\Seeder;

class RoleSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = [
            ['description' => 'admin', 'last_update' => now()],
            ['description' => 'author', 'last_update' => now()],
        ];

        foreach ($data as $d) {
            Role::create($d);
        }
    }
}
