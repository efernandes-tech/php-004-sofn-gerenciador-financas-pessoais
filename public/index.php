<?php

use Psr\Http\Message\ServerRequestInterface;
use SONFin\Application;
use SONFin\Models\CategoryCost;
use SONFin\Plugins\DbPlugin;
use SONFin\Plugins\RoutePlugin;
use SONFin\Plugins\ViewPlugin;
use SONFin\ServiceContainer;

require_once __DIR__ . '/../vendor/autoload.php';

$serviceContainer = new ServiceContainer();
$app              = new Application($serviceContainer);

$app->plugin(new RoutePlugin());
$app->plugin(new ViewPlugin());
$app->plugin(new DbPlugin());

$app
    // CREATE.
    ->get('/category-costs/new', function () use ($app) {
        $view = $app->service('view.renderer');
        return $view->render('category-costs/create.html.twig');
    }, 'category-costs.new')
    ->post('/category-costs/store', function (ServerRequestInterface $request) use ($app) {
        $data = $request->getParsedBody();
        SONFin\Models\CategoryCost::create($data);
        return $app->route('category-costs.list');
    }, 'category-costs.store')
    // RETRIEVE.
    ->get('/category-costs', function () use ($app) {
        $meuModel   = new CategoryCost();
        $categories = $meuModel->all();
        $view       = $app->service('view.renderer');
        return $view->render('category-costs/list.html.twig', [
            'categories' => $categories,
        ]);
    }, 'category-costs.list')
    // UPDATE.
    ->get('/category-costs/{id}/edit', function (ServerRequestInterface $request) use ($app) {
        $view     = $app->service('view.renderer');
        $id       = $request->getAttribute('id');
        $category = \SONFin\Models\CategoryCost::findOrFail($id);
        return $view->render('category-costs/edit.html.twig', [
            'category' => $category,
        ]);
    }, 'category-costs.edit')
    ->post('/category-costs/{id}/update', function (ServerRequestInterface $request) use ($app) {
        $id       = $request->getAttribute('id');
        $category = \SONFin\Models\CategoryCost::findOrFail($id);
        $data     = $request->getParsedBody();
        $category->fill($data);
        $category->save();
        return $app->route('category-costs.list');
    }, 'category-costs.update')
    // DELETE.
    ->get('/category-costs/{id}/show', function(ServerRequestInterface $request) use($app){
        $view = $app->service('view.renderer');
        $id = $request->getAttribute('id');
        $category = \SONFin\Models\CategoryCost::findOrFail($id);
        return $view->render('category-costs/show.html.twig', [
            'category' => $category
        ]);
    }, 'category-costs.show')
    ->get('/category-costs/{id}/delete', function(ServerRequestInterface $request) use($app){
        $id = $request->getAttribute('id');
        $category = \SONFin\Models\CategoryCost::findOrFail($id);
        $category->delete();
        return $app->route('category-costs.list');
    }, 'category-costs.delete');

$app->start();
