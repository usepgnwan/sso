<?php

namespace Database\Seeders;

use App\Models\Post;
use Illuminate\Database\Seeder;

class PostSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $count = $this->command->ask('Berapa Create Post? ');

        $check = $this->command->confirm('Yakin Create Post?');
        if ($check) {
            Post::factory()->count($count)->create();
            $this->command->info('sukses buat post');
        } else {
            $this->command->info('gagal buat post');
        }
    }
}
