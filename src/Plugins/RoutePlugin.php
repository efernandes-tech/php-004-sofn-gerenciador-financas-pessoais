<?php

namespace SONFin\Plugins;

use Aura\Router\RouterContainer;
use SONFin\ServiceContainerInterface;

class RoutePlugin implements PluginInterface
{
    public function register(ServiceContainerInterface $container)
    {
        $routerContainer = new RouterContainer();
        // Registrar as rotas da aplicação.
        $map = $routerContainer->getMap();
        // Tem a função a rota que esta sendo acessada.
        $matcher = $routerContainer->getMatcher();
        // Tem a função de gerar links com base nas rotas registradas.
        $generator = $routerContainer->getGenerator();

        $container->add('routing', $map);
        $container->add('routing.matcher', $matcher);
        $container->add('routing.generator', $generator);
    }
}
