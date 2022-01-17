<?php

namespace Database\Factories;

use App\Models\Post;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class PostFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    protected $model = Post::class;
    public function definition()
    {
        $name = $this->faker->sentence();
        $slug = Str::slug($name);
        return [
            "user_id" => rand(1, 3),
            "title" => $name,
            "slug" =>  $slug,
            "body" => $this->faker->text(),
            "publish" => false,
            "published_at" => Carbon::now(),
            'image' => $this->faker->imageUrl($width = 640, $height = 480, 'cats'),
        ];
    }
}
