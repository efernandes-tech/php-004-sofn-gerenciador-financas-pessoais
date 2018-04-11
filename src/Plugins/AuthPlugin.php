<?php

declare (strict_types = 1);

namespace SONFin\Plugins;

use Interop\Container\ContainerInterface;
use SONFin\Auth\Auth;
use SONFin\ServiceContainerInterface;

class AuthPlugin implements PluginInterface
{
    public function register(ServiceContainerInterface $container)
    {
        $container->addLazy('auth', function (ContainerInterface $container) {
            return new Auth();
        });
    }
}
