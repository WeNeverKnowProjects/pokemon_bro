import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/themes/themes.dart';

@singleton
class ThemesCubit extends Cubit<AppTheme?> {
  ThemesCubit() : super(null);

  getTheme(BuildContext context, ThemeMode mode) {
    emit(AppTheme(context, mode));
  }
}
