<?php

namespace App\Http\Controllers;

use App\Models\StatusPrizesUser;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Prize;
use App\Models\PrizesUser;
use App\Models\Product;
use Illuminate\Support\Facades\Auth;

class PanelController extends Controller
{
    public function index(Request $request)
    {
        $new_prize = [];
        if (!empty($request->input('item')))
            $new_prize = PrizesUser::where('id', $request->input('item'))->first();
        $listPrizes = PrizesUser::where('user_id', Auth::id())->orderBy('id', 'desc')->get();
        return view('dashboard', ['new_prize' => $new_prize, 'listPrizes' => $listPrizes]);
    }
}
