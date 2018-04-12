<?php

namespace SONFin\Auth;

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

    public function check(): bool
    {
        // TODO: Implement check() method.
    }

    public function logout(): void
    {
        // TODO: Implement logout() method.
    }

    /**
     * @param string $password
     * @return mixed
     */
    public function hashPassword(string $password): string
    {
        return $this->jasnyAuth->hashPassword($password);
    }
}
