<?php

declare(strict_types=1);

namespace SONFin;

class ClassName
{
    private $serviceContainer;

    /**
     * [__construct description]
     * @author Éderson Fernandes <edersonluis.rf@gmail.com>
     * @param  ServiceContainerInterface $serviceContainer [description]
     */
    function __construct(ServiceContainerInterface $serviceContainer)
    {
        $this->serviceContainer = $serviceContainer;
    }

    public function service($name)
    {
        return $this->serviceContainer->get($name);
    }

    public function addService(string $name, $service) : void
    {
        if (is_callable($service)) {
            $this->serviceContainer->addLazy($name, $service);
        } else {
            $this->serviceContainer->add($name, $service);
        }
    }

    public function plugin(PluginInterface $plugin) : void
    {
        $plugin->register($this->serviceContainer);
    }
}
