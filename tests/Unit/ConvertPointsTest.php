<?php

namespace Tests\Unit;

use App\Http\Controllers\PrizesController;
use PHPUnit\Framework\TestCase;

class ConvertPointsTest extends TestCase
{
    /**
     * A basic unit test example.
     *
     * @return void
     */
    public function testExample()
    {
        $prize = new PrizesController();
        $convert = $prize->convertScorePoints(false, 1);
        if ($convert) {
            $this->assertTrue(true);
        } else {
            $this->assertTrue(false);
        }
    }
}
