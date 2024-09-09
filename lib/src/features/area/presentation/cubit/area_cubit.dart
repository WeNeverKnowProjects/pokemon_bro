import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/enums/enums.dart';
import 'package:pokemon/src/core/usecase/usecase.dart';
import 'package:pokemon/src/features/area/domain/entities/area.dart';
import 'package:pokemon/src/features/area/domain/usecase/fetch_area_usecase.dart';

part 'area_state.dart';
part 'area_cubit.freezed.dart';

@lazySingleton
class AreaCubit extends Cubit<AreaState> {
  AreaCubit(this._fetchAreaUsecase) : super(const AreaState());
  final FetchAreaUsecase _fetchAreaUsecase;

  init() {
    if ((state.areas ?? []).isEmpty) {
      emit(state.copyWith(
        state: LoadState.initial,
        errorMessage: null,
        areas: null,
      ));
    }
  }

  loadArea() async {
    emit(state.copyWith(
      state: LoadState.loading,
      areas: null,
      errorMessage: null,
    ));

    final (fail, items) = await _fetchAreaUsecase(NoParam());
    if (fail != null) {
      emit(state.copyWith(
        errorMessage: fail.message,
        state: LoadState.failed,
      ));
    } else {
      emit(state.copyWith(
        state: LoadState.success,
        areas: items,
      ));
    }
  }
}
