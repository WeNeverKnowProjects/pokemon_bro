part of 'pokeball_gift_cubit.dart';

enum TimerState { initial, running, timeout, triggered }

@Freezed()
class PokeballGiftState with _$PokeballGiftState {
  const PokeballGiftState._();
  const factory PokeballGiftState({
    @Default(TimerState.initial) final TimerState timerState,
    final String? email,
  }) = _PokeballGiftState;
}
