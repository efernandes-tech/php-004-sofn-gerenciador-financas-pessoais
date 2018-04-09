<?php

require __DIR__ . '/vendor/autoload.php';

$db = include __DIR__ . '/config/db.php';

list(
    'driver' => $adapter,
    'host' => $host,
    'database' => $name,
    'username' => $user,
    'password' => $pass,
    'charset' => $charset,
    'collation' => $collation,
) = $db['development'];

return array(
    'paths' => array(
        'migrations' => array(
            __DIR__ . '/db/migrations',
        ),
        'seeds' => array(
            __DIR__ . '/db/seeds'
        )
    ),
    'environments' => array(
        'default_migration_table' => 'migrations',
        'default_database' => 'development',
        'development' => array(
            'adapter' => $adapter,
            'host' => $host,
            'name' => $name,
            'user' => $user,
            'pass' => $pass,
            'charset' => $charset,
            'collation' => $collation,
        ),
    ),
);