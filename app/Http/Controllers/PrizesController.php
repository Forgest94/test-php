<?php

namespace App\Http\Controllers;

use App\Models\Prize;
use App\Models\PrizesUser;
use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PrizesController extends Controller
{
    public function setStatus(Request $request)
    {
        if (!empty($request->item_id)) {
            $isPrizeUser = PrizesUser::where('id', $request->item_id)->first();
            $prizeInfo = $isPrizeUser->Prize()->first();
            $user = User::where('id', $isPrizeUser->user_id)->first();
            switch ($prizeInfo->type_prizes_id) {
                case 1:
                    $user->score = $user->score + $isPrizeUser->sum;
                    break;
                case 2:
                    $user->points = $user->points + $isPrizeUser->sum;
                    break;
            }
            $isPrizeUser->status_id = 2;
            $user->save();
            $isPrizeUser->save();

            return redirect('/dashboard');
        }
    }

    public function addPrizeUser(Request $request)
    {
        if (!empty($request->input('random'))) {
            $randomPrize = Prize::orderByRaw("RAND()")->first();
            if ($randomPrize->max_sum > $randomPrize->fact_sum) {
                switch ($randomPrize->type_prizes_id) {
                    case 1:
                    case 2:
                        $sum = rand($randomPrize->interval_from, $randomPrize->interval_to);
                        $randomPrize->fact_sum = $randomPrize->fact_sum + $sum;
                        $randomPrize->save();
                        $winPrize = PrizesUser::create([
                            'user_id' => Auth::id(),
                            'prize_id' => $randomPrize->id,
                            'sum' => $sum,
                            'product_id' => false,
                            'status_id' => 1,
                        ]);
                        break;
                    case 3:
                        $randomProduct = Product::where('count', '>', 0)->orderByRaw("RAND()")->first();
                        $randomProduct->count = $randomProduct->count - 1;
                        $randomProduct->save();
                        $winPrize = PrizesUser::create([
                            'user_id' => Auth::id(),
                            'prize_id' => $randomPrize->id,
                            'sum' => 1,
                            'product_id' => $randomProduct->id,
                            'status_id' => 1,
                        ]);
                        break;
                }
            } else {
                $this->addPrizeUser($request);
            }
        }
        if (!empty($winPrize->id))
            return redirect('/dashboard?item=' . $winPrize->id);
    }

    public function convertScorePoints(Request $request, $unit)
    {
        $id = '';
        if (!empty($request->input('item_id'))) {
            $id = $request->input('item_id');
        } else {
            $id = $unit;
        }
        if ($id) {
            $isPrizeUser = PrizesUser::where('id', $id)->first();
            $prizeInfo = $isPrizeUser->Prize()->first();
            if ($prizeInfo->type_prizes_id == 1) {
                $pintPrize = Prize::where('type_prizes_id', 2)->first();
                $isPrizeUser->prize_id = $pintPrize->id;
                $percent = 30;
                $isPrizeUser->sum = ($isPrizeUser->sum / 100) * $percent;
                $isPrizeUser->save();
            }
        }
        if (empty($unit)) {
            return redirect('/dashboard');
        } else {
            return !empty($isPrizeUser->id) ? $isPrizeUser->id : false;
        }
    }
}
