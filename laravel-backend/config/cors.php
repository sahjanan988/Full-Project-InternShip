<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Cross-Origin Resource Sharing (CORS)
    |--------------------------------------------------------------------------
    |
    | Here you may configure the access-control-allow-origin settings for your
    | application. By default we have disabled CORS and have set the allowed
    | origins to *. You may wish to change this to a more restrictive set.
    |
    */

    'cors' => [
        'origins' => ['http://localhost:4200', 'https://your-angular-app.com'], // Replace with your Angular frontend's domain
        'methods' => ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
        'allowed_headers' => ['X-Requested-With', 'Accept', 'Content-Type', 'Authorization'],
        'exposed_headers' => [],
        'max_age' => 0,
    ],

];