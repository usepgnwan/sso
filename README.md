<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>
<p align="center">
    USECASE
    <img src="https://github.com/usepgnwan/sso/blob/main/public/images/UseCaseDiagram1.jpg" width="400"> </p>
 

## Databases
    Dapat menggunakan migration & seeder
        php artisan migrate
        php artisan db:seed
           NOTE: saat menggunakan seeder user, email harus di ubah menjadi @gmail.com , karena saat login menggunakan validasi email:dns
    atau menggunakan mysql database yg sudah di sediakan :
    folder db_mysql/db_sso.sql
        Akun:
        admin user : 
            beier.micaela@gmail.com
            password
        author user :
            kohler.hyman@gmail.com
            password
            hstehr@gmail.com
            password
      

<p>  <img src="https://github.com/usepgnwan/sso/blob/main/public/images/front.jpg" width="1000"> </p> 
## SS ROLE ADMIN 
<p><img src="https://github.com/usepgnwan/sso/blob/main/public/images/admin_dashboard.jpg" width="1000"></p> 
<p><img src="https://github.com/usepgnwan/sso/blob/main/public/images/admin_role.jpg" width="1000"></p> 
<p><img src="https://github.com/usepgnwan/sso/blob/main/public/images/admin_user.jpg" width="1000"></p> 
<p><img src="https://github.com/usepgnwan/sso/blob/main/public/images/admin_privilege.jpg" width="1000"></p>  
<p><img src="https://github.com/usepgnwan/sso/blob/main/public/images/admin_role_privilige.jpg" width="1000"></p> 

## SS ROLE AUTHOR 
<p><img src="https://github.com/usepgnwan/sso/blob/main/public/images/author_dashboard.jpg" width="1000"></p> 
 
Terima Kasih



## Passport Installation

get library passport in terminal:
```
composer require laravel/passport
```
migration passport will be created, and migrate to add to table on database:
```
php artisan migrate
```
Next, you should run install all package passport :
```
php artisan passport:install
```
### Passport Configuration
add the Laravel\Passport\HasApiTokens trait to model App\Models\User:
```
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
}
```
Next, add Passport::routes to method within the boot method of AuthServiceProvider. This method will register the routes necessary to issue access tokens and revoke access tokens, clients, and personal access tokens:
```
<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use Laravel\Passport\Passport;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        'App\Models\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Passport::routes();
    }
}
```
in config/auth.php configuration file, set the driver option of the api authentication guard to passport. This will instruct your application to use Passport's TokenGuard when authenticating incoming API requests:

``
'guards' => [
    'web' => [
        'driver' => 'session',
        'provider' => 'users',
    ],

    'api' => [
        'driver' => 'passport',
        'provider' => 'users',
    ],
],
```