<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
        <span>Деньги: {{ Auth::user()->score }} р.</span>
        <br/>
        <span>Бонусные баллы: {{ Auth::user()->points }}</span>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    <form action="/prize/add/user" method="post">
                        {{ csrf_field() }}
                        <input type="hidden" name="random" value="Y">
                        <button type="submit" style="display:block;border: 1px solid; padding: 10px;margin: 0 auto;">
                            Получить приз
                        </button>
                    </form>
                    @if(!empty($new_prize))
                        @php($newPrizeInfo = $new_prize->Prize()->first())
                        @php($newPrizeTypeName = $newPrizeInfo->TypePrize()->first()->name)
                        <div style="text-align: center;">
                            <h3 class="font-semibold text-xl text-gray-800 leading-tight">Ваш приз:</h3>
                            <span>{{ $newPrizeTypeName }}: </span>
                            @switch($newPrizeInfo->type_prizes_id)
                                @case(1)
                                @case(2)
                                <span>{{ $new_prize->sum }}</span>
                                @break
                                @case(3)
                                @php($newProductPrizeInfo = $new_prize->Product()->first())
                                <span>{{ $newProductPrizeInfo->name }}</span>
                                @break
                            @endswitch
                        </div>
                    @endif
                </div>
            </div>
        </div>
        <br/>
        <hr/>
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <h3 class="font-semibold text-xl text-gray-800 leading-tight">Список призов</h3>
            <div style="height: 300px; overflow: scroll; ">
                @if(!empty($listPrizes))
                    @foreach($listPrizes as $item)
                        @php($prizeInfo = $item->Prize()->first())
                        @php($prizeTypeName = $prizeInfo->TypePrize()->first()->name)
                        @php($statusInfo = $item->Status()->first())
                        <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                            <div class="p-6 bg-white border-b border-gray-200">
                                <div style="display: inline-block;">{{ $prizeTypeName }}</div>
                                |
                                <div style="display: inline-block;">
                                    @switch($prizeInfo->type_prizes_id)
                                        @case(1)
                                        @case(2)
                                        {{ $item->sum }}
                                        @break
                                        @case(3)
                                        @php($productInfo = $item->Product()->first())
                                        {{ $productInfo->name }}
                                        @break
                                    @endswitch
                                </div>
                                |
                                <div style="display: inline-block;">
                                    <div style="display: inline-block; font-family: cursive;">
                                        {{ $statusInfo->name }}
                                    </div>
                                    @if($item->status_id == 1)
                                        <div style="display: inline-block;">
                                            <form action="/prize/status/set" method="post" style="text-align: center;">
                                                {{ csrf_field() }}
                                                <input type="hidden" name="item_id" value="{{ $item->id }}">
                                                <button type="submit"
                                                        style="display:block;border: 1px solid; padding: 10px;">
                                                    Использовать приз
                                                </button>
                                            </form>
                                        </div>
                                        @if($prizeInfo->type_prizes_id == 1)
                                            <div style="display: inline-block;">
                                                <form action="/prize/convert/points" method="post">
                                                    {{ csrf_field() }}
                                                    <input type="hidden" name="item_id" value="{{ $item->id }}">
                                                    <button type="submit">Конвертировать</button>
                                                </form>
                                            </div>
                                        @endif
                                    @endif

                                </div>
                            </div>
                        </div>
                    @endforeach
                @else
                    <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <div class="p-6 bg-white border-b border-gray-200">
                            {{ __('Список пуст') }}
                        </div>
                    </div>
                @endif
            </div>
        </div>
    </div>
</x-app-layout>
