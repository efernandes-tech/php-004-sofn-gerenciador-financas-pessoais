<?php

declare (strict_types = 1);

namespace SONFin\Auth;

interface AuthInterface
{
    /**
     * @param array $credentials
     */
    public function login(array $credentials): bool;

    public function check(): bool;

    public function logout(): void;

    public function hashPassword(string $password): string;
}
