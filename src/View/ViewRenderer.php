<?php

declare(strict_types=1);

namespace SONFin\View;

use Psr\Http\Message\ResponseInterface;
use Zend\Diactoros\Response;

class ViewRenderer implements ViewRendererInterface
{
    private $twigEnvironment;

    public function __construct(\Twig_Environment $twigEnvironment)
    {
        $this->twigEnvironment = $twigEnvironment;
    }

    public function render(string $template, array $context = array()) : ResponseInterface
    {
        $result = $this->twigEnvironment->render($template, $context);

        $response = new Response();

        $response->getBody()->write($result);

        return $response;
    }
}
