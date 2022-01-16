<?php

namespace Database\Seeders;

use App\Models\Privilege;
use Illuminate\Database\Seeder;

class PrivilegeSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = [
            [
                'description' => 'view data',
                'last_update' => now(),
            ],
            [
                'description' => 'create data',
                'last_update' => now(),
            ],
            [
                'description' => 'update data',
                'last_update' => now(),
            ],
            [
                'description' => 'delete data',
                'last_update' => now(),
            ],
            [
                'description' => 'show data',
                'last_update' => now(),
            ],
            [
                'description' => 'publish data',
                'last_update' => now(),
            ]
        ];

        foreach ($data as $d) {
            Privilege::create($d);
        }
    }
}
