<?php

declare(strict_types=1);

namespace SONFin\Plugins;

use SONFin\ServiceContainerInterface;
use Aura\Router\RouterContainer;
use Psr\Http\Message\RequestInterface;
use Interop\Container\ContainerInterface;
use Zend\Diactoros\ServerRequestFactory;

class ViewPlugin implements PluginInterface
{
    public function register(ServiceContainerInterface $container)
    {
        $container->addLazy('twig', function(ContainerInterface $container){
            $loader = new \Twig_Loader_Filesystem(__DIR__ . '/../../templates');
            $twig = new \Twig_Environment($loader);
            return $twig;
        });
    }
}
