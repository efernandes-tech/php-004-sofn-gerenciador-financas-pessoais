<?php

use SONFin\ServiceContainer;
use SONFin\Application;
use SONFin\Plugins\RoutePlugin;

require_once __DIR__ . '/../vendor/autoload.php';

$serviceContainer = new ServiceContainer();
$app = new Application($serviceContainer);

$app->plugin(new RoutePlugin());

$app->get('/', function() {
    echo 'Hello World, Éderson!!!';
});

$app->get('/home', function() {
    echo 'Mostrando a Home!!!';
});

$app->start();
