<?php

use Psr\Http\Message\ServerRequestInterface;
use SONFin\Application;
use SONFin\Plugins\RoutePlugin;
use SONFin\Plugins\ViewPlugin;
use SONFin\Plugins\DbPlugin;
use SONFin\Models\CategoryCost;
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

$app
    ->get('/category-costs', function() use ($app) {
        $meuModel = new CategoryCost();
        $categories = $meuModel->all();
        $view = $app->service('view.renderer');
        return $view->render('category-costs/list.html.twig',[
            'categories' => $categories
        ]);
    })
    ->get('/category-costs/new', function() use($app){
        $view = $app->service('view.renderer');
        return $view->render('category-costs/create.html.twig');
    })
    ->post('/category-costs/store', function(ServerRequestInterface $request){
        $data = $request->getParsedBody();
        SONFin\Models\CategoryCost::create($data);
        return new \Zend\Diactoros\Response\RedirectResponse('/category-costs');
    });

$app->start();
