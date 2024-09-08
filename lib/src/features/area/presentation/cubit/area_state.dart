part of 'area_cubit.dart';

@Freezed()
class AreaState with _$AreaState {
  const AreaState._();
  const factory AreaState({
    @Default(LoadState.initial) final LoadState? state,
    List<Area>? areas,
    String? errorMessage,
  }) = _AreaState;
}
