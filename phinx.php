<?php

require __DIR__ . '/vendor/autoload.php';

if (file_exists(__DIR__ . '/.env')) {
    $dotenv = new \Dotenv\Dotenv(__DIR__);
    $dotenv->overload();
}

$db = include __DIR__ . '/config/db.php';

list(
    'driver'    => $adapter,
    'host'      => $host,
    'database'  => $name,
    'username'  => $user,
    'password'  => $pass,
    'charset'   => $charset,
    'collation' => $collation
) = $db['default_connection'];

return array(
    'paths'        => array(
        'migrations' => array(
            __DIR__ . '/db/migrations',
        ),
        'seeds'      => array(
            __DIR__ . '/db/seeds',
        ),
    ),
    'environments' => array(
        'default_migration_table' => 'migrations',
        'default_database'        => 'default_connection',
        'default_connection'             => array(
            'adapter'   => $adapter,
            'host'      => $host,
            'name'      => $name,
            'user'      => $user,
            'pass'      => $pass,
            'charset'   => $charset,
            'collation' => $collation,
        ),
    ),
);
