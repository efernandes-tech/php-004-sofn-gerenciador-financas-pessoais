<?php

/**
 * DD/MM/YYYY -> YYYY-MM-DD
 *
 * @param $date
 */
function dateParse($date)
{
    $dateArray = explode('/', $date);
    $dateArray = array_reverse($dateArray);
    return implode('-', $dateArray);
}

/**
 * 1.000,50 -> 1000.50
 *
 * @param  $number
 * @return mixed
 */
function numberParse($number)
{
    $newNumber = str_replace('.', '', $number);
    $newNumber = str_replace(',', '.', $newNumber);
    return $newNumber;
}
