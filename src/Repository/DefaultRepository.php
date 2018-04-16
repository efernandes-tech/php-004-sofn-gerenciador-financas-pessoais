<?php

declare (strict_types = 1);

namespace SONFin\Repository;

use Illuminate\Database\Eloquent\Model;

class DefaultRepository implements RepositoryInterface
{
    /**
     * @var mixed
     */
    private $_modelClass;
    /**
     * @var Model
     */
    private $_model;

    /**
     * @param string $modelClass
     */
    public function __construct(string $modelClass)
    {
        $this->_modelClass = $modelClass;
        $this->_model      = new $modelClass;
    }

    /**
     * @return mixed
     */
    public function all(): array
    {
        return $this->_model->all()->toArray();
    }

    /**
     * @param array $data
     * @return mixed
     */
    public function create(array $data)
    {
        $this->_model->fill($data);
        $this->_model->save();
        return $this->_model;
    }

    /**
     * @param $id
     * @param array $data
     * @return mixed
     */
    public function update($id, array $data)
    {
        $model = $this->findInternal($id);
        $model->fill($data);
        $model->save();
        return $model;
    }

    /**
     * @param $id
     */
    public function delete($id)
    {
        $model = $this->findInternal($id);
        $model->delete();
    }

    /**
     * @param int  $id
     * @param bool $failIfNotExist
     * @return mixed
     */
    public function find(int $id, bool $failIfNotExist = true)
    {
        return $failIfNotExist
        ? $this->_model->findOrFail($id)
        : $this->_model->find($id);
    }

    /**
     * @param string $field
     * @param $value
     * @return mixed
     */
    public function findByField(string $field, $value)
    {
        return $this->_model->where($field, '=', $value)->get();
    }

    /**
     * @param array $search
     * @return mixed
     */
    public function findOneBy(array $search)
    {
        $queryBuilder = $this->_model;
        foreach ($search as $field => $value) {
            $queryBuilder = $queryBuilder->where($field, '=', $value);
        }

        return $queryBuilder->firstOrFail();
    }

    /**
     * @param $id
     */
    protected function findInternal($id)
    {
        return is_array($id) ? $this->findOneBy($id) : $this->find($id);
    }
}
