import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/log/logger.dart';

part 'pokeball_gift_state.dart';
part 'pokeball_gift_cubit.freezed.dart';

@lazySingleton
class PokeballGiftCubit extends Cubit<PokeballGiftState> {
  PokeballGiftCubit() : super(const PokeballGiftState());

  pokeballGiftListen({
    String? email,
    DateTime? loginAt,
  }) async {
    if (email == null && loginAt == null) return;
    var diff = DateTime.now().difference(loginAt!);
    var inMinutes = diff.inMinutes;
    if (inMinutes > 20) {
      Logger.d("timeout 1 executed");
      emit(state.copyWith(timerState: TimerState.timeout));

      return;
    }

    Timer.periodic(const Duration(minutes: 1), (timer) {
      var currentDiff = DateTime.now().difference(loginAt);
      var currentMinuteDiff = currentDiff.inMinutes;
      Logger.d("minute diff running on $currentMinuteDiff");
      if (currentMinuteDiff > 20) {
        Logger.d("timeout 2 executed");
        timer.cancel();
        emit(state.copyWith(timerState: TimerState.timeout));
        return;
      }
      if (state.timerState != TimerState.running) {
        emit(state.copyWith(
          timerState: TimerState.running,
          email: email,
        ));
      }
      if (currentMinuteDiff % 5 == 0) {
        emit(state.copyWith(
          timerState: TimerState.triggered,
          email: email,
        ));
      }
    });
  }
}
