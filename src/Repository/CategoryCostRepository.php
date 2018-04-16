<?php

declare (strict_types = 1);

namespace SONFin\Repository;

use SONFin\Models\CategoryCost;

class CategoryCostRepository extends DefaultRepository implements CategoryCostRepositoryInterface
{
    /**
     * CategoryCostRepository constructor.
     */
    public function __construct()
    {
        parent::__construct(CategoryCost::class);
    }

    /**
     * @param string $dateStart
     * @param string $dateEnd
     * @param int $userId
     * @return mixed
     */
    public function sumByPeriod(string $dateStart, string $dateEnd, int $userId): array
    {
        $categories = CategoryCost::query()
            ->selectRaw('category_costs.name, SUM(value) AS value')
            ->leftJoin('bill_pays', 'bill_pays.category_cost_id', '=', 'category_costs.id')
            ->where('category_costs.user_id', $userId)
            ->whereBetween('data_launch', [$dataStart, $dataEnd])
            ->groupBy('value')
            ->groupBy('category_costs.name')
            ->get();
        return $categories->toArray();
    }
}
