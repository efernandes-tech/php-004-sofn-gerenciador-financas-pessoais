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

$app
    ->get('/category-costs', function() use($app){
        $meuModel = new CategoryCost();
        $categories = $meuModel->all();
        $view = $app->service('view.renderer');
        return $view->render('category-costs/list.html.twig',[
            'categories' => $categories
        ]);
    }, 'category-costs.list')
    ->get('/category-costs/new', function() use($app){
        $view = $app->service('view.renderer');
        return $view->render('category-costs/create.html.twig');
    }, 'category-costs.new')
    ->post('/category-costs/store', function(ServerRequestInterface $request) use($app){
        $data = $request->getParsedBody();
        SONFin\Models\CategoryCost::create($data);
        return $app->route('category-costs.list');
    }, 'category-costs.store');

$app->start();
