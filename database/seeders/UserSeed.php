<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class UserSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        $count = $this->command->ask('Berapa Create User? ');

        $check = $this->command->confirm('Yakin Create user?');
        if ($check) {
            User::factory()->count($count)->create();
            $this->command->info('sukses buat user');
        } else {
            $this->command->info('gagal buat user');
        }
    }
}
