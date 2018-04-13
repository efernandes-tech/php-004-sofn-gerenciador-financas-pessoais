<?php

namespace SONFin\Repository;

class StatementRepository implements StatementRepositoryInterface
{

    /**
     * @param string $dateStart
     * @param string $dateEnd
     * @param int $userId
     */
    public function all(string $dateStart, string $dateEnd, int $userId): array
    {
        //select from bill_pays left join category_costs
        $billPays = BillPay::query()
            ->selectRaw('bill_pays.*, category_costs.name as category_name')
            ->leftJoin('category_costs', 'category_costs.id', '=', 'bill_pays.category_cost_id')
            ->whereBetween('date_launch', [$dateStart, $dateEnd])
            ->where('bill_pays.user_id', $userId)
            ->get();

        $billReceives = BillReceive::query()
            ->whereBetween('date_launch', [$dateStart, $dateEnd])
            ->where('user_id', $userId)
            ->get();
    }
}
