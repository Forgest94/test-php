<?php

namespace App\Console\Commands;

use App\Models\PrizesUser;
use App\Models\User;
use Illuminate\Console\Command;

class SendPrizes extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:send_prizes {step=3}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'отправляет денежные призы на счета пользователей, которые еще не были отправлены';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $prizes = PrizesUser::where('status_id', 1)->orderBy('id', 'asc')->paginate($this->argument('step'));
        $upldateElements = [];
        foreach ($prizes as $prize) {
            $prizeInfo = $prize->Prize()->first();
            $user = User::where('id', $prize->user_id)->first();
            switch ($prizeInfo->type_prizes_id) {
                case 1:
                    $user->score = $user->score + $prize->sum;
                    break;
                case 2:
                    $user->points = $user->points + $prize->sum;
                    break;
            }
            $prize->status_id = 2;
            $user->save();
            $prize->save();
            $upldateElements[] = 'Y';
        }
        echo 'Обновлено ' . $upldateElements . ' шт.';
    }
}
