<?php

use Psr\Http\Message\ServerRequestInterface;
use SONFin\Application;
use SONFin\Plugins\RoutePlugin;
use SONFin\Plugins\ViewPlugin;
use SONFin\Plugins\DbPlugin;
use SONFin\ServiceContainer;

require_once __DIR__ . '/../vendor/autoload.php';

$serviceContainer = new ServiceContainer();
$app = new Application($serviceContainer);

$app->plugin(new RoutePlugin());
$app->plugin(new ViewPlugin());
$app->plugin(new DbPlugin());

// $app->get('/{name}', function(ServerRequestInterface $request) use ($app) {
//     $view = $app->service('view.renderer');
//     return $view->render('test.html.twig', array('name' => $request->getAttribute('name')));
// });

$app->get('/home/{name}/{id}', function(ServerRequestInterface $request){
    $response = new \Zend\Diactoros\Response();
    $response->getBody()->write("response com emmiter do diactoros");
    return $response;
});

$app->get('/category-costs', function() use ($app) {
    $view = $app->service('view.renderer');
    return $view->render('category-costs/list.html.twig');
});

$app->start();
