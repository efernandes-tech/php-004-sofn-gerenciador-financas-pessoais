<?php

use SONFin\ServiceContainer;
use SONFin\Application;
use SONFin\Plugins\RoutePlugin;
use Psr\Http\Message\ServerRequestInterface;

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

$app->get('/home/{name}/{id}', function(ServerRequestInterface $request){
    echo "Mostrando a home!!";
    echo "<br>";
    echo $request->getAttribute("name");
    echo "<br>";
    echo $request->getAttribute("id");
    echo "<br>";
});

$app->start();
