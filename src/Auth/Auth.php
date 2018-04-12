<?php

namespace SONFin\Auth;

use SONFin\Models\UserInterface;

class Auth implements AuthInterface
{
    /**
     * @var JasnyAuth
     */
    private $jasnyAuth;

    /**
     * @param JasnyAuth $jasnyAuth
     */
    public function __construct(JasnyAuth $jasnyAuth)
    {
        $this->jasnyAuth = $jasnyAuth;
        $this->sessionStart();
    }

    /**
     * @param array $credentials
     * @return mixed
     */
    public function login(array $credentials): bool
    {
        list('email' => $email, 'password' => $password) = $credentials;
        return $this->jasnyAuth->login($email, $password) !== null;
    }

    /**
     * @return mixed
     */
    public function check(): bool
    {
        return $this->user() !== null;
    }

    public function logout(): void
    {
        $this->jasnyAuth->logout();
    }

    /**
     * @return mixed
     */
    public function user(): ? UserInterface
    {
        return $this->jasnyAuth->user();
    }

    /**
     * @param string $password
     * @return mixed
     */
    public function hashPassword(string $password): string
    {
        return $this->jasnyAuth->hashPassword($password);
    }

    protected function sessionStart()
    {
        if (session_status() == PHP_SESSION_NONE) {
            session_start();
        }
    }
}
