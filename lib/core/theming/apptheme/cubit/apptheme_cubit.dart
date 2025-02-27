import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../app_theme.dart';
import '../../theme_cach_helper.dart';

part 'apptheme_state.dart';

class AppthemeCubit extends Cubit<ChangeTheme> {
  AppthemeCubit() : super(const ChangeTheme());

  Future<void> changeTheme(bool isDark) async {
    await ThemeCachHelper().saveThemeData(isDark);
    emit(ChangeTheme(theme: isDark ? appthemedata[AppTheme.dark]! : appthemedata[AppTheme.light]!));
  }

  Future<void> getthemeTheme() async {
    final isDark = await ThemeCachHelper().getThemeData();
    log('$isDark');
    emit(ChangeTheme(theme: isDark ? appthemedata[AppTheme.dark]! : appthemedata[AppTheme.light]!));
  }
}
