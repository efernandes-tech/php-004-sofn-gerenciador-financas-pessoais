<?php

declare (strict_types = 1);

namespace SONFin\Repository;

use Illuminate\Database\Eloquent\Model;

class DefaultRepository implements RepositoryInterface
{
    private $_modelClass;
    /**
     * @var Model
     */
    private $_model;

    public function __construct(string $modelClass)
    {
        $this->_modelClass = $modelClass;
        $this->_model      = new $modelClass;
    }

    public function all(): array
    {

    }

    public function create(array $data)
    {

    }

    public function update(int $id, array $data)
    {

    }

    public function delete(int $id)
    {

    }

    public function find(int $id)
    {

    }
}
