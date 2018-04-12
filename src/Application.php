<?php

declare (strict_types = 1);

namespace SONFin;

use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;
use SONFin\Plugins\PluginInterface;
use SONFin\ServiceContainerInterface;
use Zend\Diactoros\Response\RedirectResponse;
use Zend\Diactoros\Response\SapiEmitter;

class Application
{
    /**
     * @var mixed
     */
    private $serviceContainer;
    /**
     * @var array
     */
    private $befores = [];

    /**
     * @param ServiceContainerInterface $serviceContainer
     */
    public function __construct(ServiceContainerInterface $serviceContainer)
    {
        $this->serviceContainer = $serviceContainer;
    }

    /**
     * @param $name
     * @return mixed
     */
    public function service($name)
    {
        return $this->serviceContainer->get($name);
    }

    /**
     * @param string $name
     * @param $service
     */
    public function addService(string $name, $service): void
    {
        if (is_callable($service)) {
            $this->serviceContainer->addLazy($name, $service);
        } else {
            $this->serviceContainer->add($name, $service);
        }
    }

    /**
     * @param PluginInterface $plugin
     */
    public function plugin(PluginInterface $plugin): void
    {
        $plugin->register($this->serviceContainer);
    }

    /**
     * @param $path
     * @param $action
     * @param $name
     * @return mixed
     */
    public function get($path, $action, $name = null): Application
    {
        $routing = $this->service('routing');
        $routing->get($name, $path, $action);
        return $this;
    }

    /**
     * @param $path
     * @param $action
     * @param $name
     * @return mixed
     */
    public function post($path, $action, $name = null): Application
    {
        $routing = $this->service('routing');
        $routing->post($name, $path, $action);
        return $this;
    }

    /**
     * @param $path
     */
    public function redirect($path): ResponseInterface
    {
        return new RedirectResponse($path);
    }

    /**
     * @param string $name
     * @param array $params
     * @return mixed
     */
    public function route(string $name, array $params = []): ResponseInterface
    {
        $generator = $this->service('routing.generator');
        $path      = $generator->generate($name, $params);
        return $this->redirect($path);
    }

    /**
     * @param $callback
     * @return mixed
     */
    public function before(callable $callback): Application
    {
        array_push($this->befores, $callback);

        return $this;
    }

    /**
     * @return mixed
     */
    protected function runBefores():  ? ResponseInterface
    {
        foreach ($this->befores as $callback) {
            $result = $callback($this->service(RequestInterface::class));
            if ($result instanceof ResponseInterface) {
                return $result;
            }
        }
        return null;
    }

    /**
     * @return null
     */
    public function start() : void
    {
        $route = $this->service('route');

        $request = $this->service(RequestInterface::class);

        if (!$route) {
            echo "Page not found!";
            exit;
        }

        foreach ($route->attributes as $key => $value) {
            $request = $request->withAttribute($key, $value);
        }

        $result = $this->runBefores();
        if ($result) {
            $this->emitResponse($result);
            return;
        }

        $callable = $route->handler;
        $response = $callable($request);
        $this->emitResponse($response);
    }

    /**
     * @param ResponseInterface $response
     */
    protected function emitResponse(ResponseInterface $response): void
    {
        $emitter = new SapiEmitter();

        $emitter->emit($response);
    }
}
