<?php

declare (strict_types = 1);

namespace SONFin\Repository;

interface StatementRepositoryInterface
{
    /**
     * @param string $dateStart
     * @param string $dateEnd
     * @param int $userId
     */
    public function all(string $dateStart, string $dateEnd, int $userId): array;
}
