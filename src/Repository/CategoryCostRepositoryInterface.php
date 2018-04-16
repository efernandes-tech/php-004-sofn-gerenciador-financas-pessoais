<?php

declare (strict_types = 1);

namespace SONFin\Repository;

interface CategoryCostRepositoryInterface extends RepositoryInterface
{
    /**
     * @param string $dateStart
     * @param string $dateEnd
     * @param int    $userId
     */
    public function sumByPeriod(string $dateStart, string $dateEnd, int $userId): array;
}
