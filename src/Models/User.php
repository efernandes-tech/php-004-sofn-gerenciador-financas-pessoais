<?php

declare (strict_types = 1);

namespace SONFin\Models;

use Illuminate\Database\Eloquent\Model;
use Jasny\Auth\User as JasnyUser;

class User extends Model implements JasnyUser, UserInterface
{
    /**
     * Mass Assignment.
     *
     * @var array
     */
    protected $fillable = [
        'first_name',
        'last_name',
        'email',
        'password',
    ];

    public function getId(): int
    {
        return (int) $this->id;
    }

    /**
     * @return mixed
     */
    public function getUsername(): string
    {
        return $this->email;
    }

    /**
     * @return mixed
     */
    public function getHashedPassword(): string
    {
        return $this->password;
    }

    public function onLogin()
    {
        // TODO: Implement onLogin() method.
    }

    public function onLogout()
    {
        // TODO: Implement onLogout() method.
    }

    public function getFullname(): string
    {
        return "{$this->first_name} {$this->last_name}";
    }

    /**
     * @return mixed
     */
    public function getEmail(): string
    {
        return $this->email;
    }

    /**
     * @return mixed
     */
    public function getPassword(): string
    {
        return $this->password;
    }
}
