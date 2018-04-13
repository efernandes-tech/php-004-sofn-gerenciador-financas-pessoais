<?php

use Psr\Http\Message\ServerRequestInterface;

$app

// CREATE.
->get('/bill-pays/new', function () use ($app) {
    $view = $app->service('view.renderer');
    return $view->render('bill-pays/create.html.twig');
}, 'bill-pays.new')
    ->post('/bill-pays/store', function (ServerRequestInterface $request) use ($app) {
        $data                = $request->getParsedBody();
        $repository          = $app->service('bill-pay.repository');
        $auth                = $app->service('auth');
        $data['user_id']     = $auth->user()->getId();
        $data['date_launch'] = dateParse($data['date_launch']);
        $data['value']       = numberParse($data['value']);
        $repository->create($data);
        return $app->redirect('/bill-pays');
    }, 'bill-pays.store')

// RETRIEVE.
    ->get('/bill-pays', function () use ($app) {
        $view       = $app->service('view.renderer');
        $repository = $app->service('bill-pay.repository');
        $auth       = $app->service('auth');
        $bills      = $repository->findByField('user_id', $auth->user()->getId());
        return $view->render('bill-pays/list.html.twig', [
            'bills' => $bills,
        ]);
    }, 'bill-pays.list')

// UPDATE.
    ->get('/bill-pays/{id}/edit', function (ServerRequestInterface $request) use ($app) {
        $view       = $app->service('view.renderer');
        $id         = $request->getAttribute('id');
        $repository = $app->service('bill-pay.repository');
        $auth       = $app->service('auth');
        $bill       = $repository->findOneBy([
            'id'      => $id,
            'user_id' => $auth->user()->getId(),
        ]);
        return $view->render('bill-pays/edit.html.twig', [
            'bill' => $bill,
        ]);
    }, 'bill-pays.edit')
    ->post('/bill-pays/{id}/update', function (ServerRequestInterface $request) use ($app) {
        $repository          = $app->service('bill-pay.repository');
        $id                  = $request->getAttribute('id');
        $data                = $request->getParsedBody();
        $auth                = $app->service('auth');
        $data['user_id']     = $auth->user()->getId();
        $data['date_launch'] = dateParse($data['date_launch']);
        $data['value']       = numberParse($data['value']);
        $repository->update([
            'id'      => $id,
            'user_id' => $auth->user()->getId(),
        ], $data);
        return $app->route('bill-pays.list');
    }, 'bill-pays.update')

// DELETE.
    ->get('/bill-pays/{id}/show', function (ServerRequestInterface $request) use ($app) {
        $view       = $app->service('view.renderer');
        $id         = $request->getAttribute('id');
        $repository = $app->service('bill-pay.repository');
        $auth       = $app->service('auth');
        $bill       = $repository->findOneBy([
            'id'      => $id,
            'user_id' => $auth->user()->getId(),
        ]);
        return $view->render('bill-pays/show.html.twig', [
            'bill' => $bill,
        ]);
    }, 'bill-pays.show')
    ->get('/bill-pays/{id}/delete', function (ServerRequestInterface $request) use ($app) {
        $repository = $app->service('bill-pay.repository');
        $id         = $request->getAttribute('id');
        $auth       = $app->service('auth');
        $repository->delete([
            'id'      => $id,
            'user_id' => $auth->user()->getId(),
        ]);
        return $app->route('bill-pays.list');
    }, 'bill-pays.delete');
