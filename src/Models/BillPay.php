<?php

namespace SONFin\Models;

use Illuminate\Database\Eloquent\Model;

class BillPay extends Model
{
    /**
     * Mass Assignment
     *
     * @var array
     */
    protected $fillable = [
        'date_launch',
        'name',
        'value',
        'user_id',
        'category_cost_id',
    ];

    /**
     * Criando o relacionamento.
     * 1 categoria pode estar em varias contas a pagar.
     * 1 conta a pagar tem uma categoria.
     *
     * @return mixed
     */
    public function categoryCost()
    {
        return $this->belongsTo(CategoryCost::class);
    }
}
