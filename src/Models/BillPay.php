<?php

namespace SONFin\Models;

use Illuminate\Database\Eloquent\Model;

class BillPay extends Model
{
    /**
     * Mass Assignment
     * @var array
     */
    protected $fillable = [
        'date_launch',
        'name',
        'value',
        'user_id',
        'category_cost_id',
    ];
}
