import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'sneaker_theme_state.dart';

class SneakerThemeCubit extends HydratedCubit<SneakerThemeState> {
  SneakerThemeCubit() : super(const SneakerThemeState());

  @override
  SneakerThemeState? fromJson(Map<String, dynamic> json) {
    String theme = json['themeMode'];
    SneakerThemeMode themeMode = _mapStringToThemeMode(theme);
    return state.copyWith(themeMode: themeMode);
  }

  @override
  Map<String, dynamic>? toJson(SneakerThemeState state) {
    Map<String, dynamic> data = {};
    String theme = describeEnum(state.themeMode);
    data['themeMode'] = theme;
    return data;
  }

  SneakerThemeMode _mapStringToThemeMode(String themeMode) {
    switch (themeMode) {
      case 'darkMode':
        return SneakerThemeMode.darkMode;
      case 'lightMode':
        return SneakerThemeMode.lightMode;
      default:
        return SneakerThemeMode.darkMode;
    }
  }

  void onThemeModeChanged() {
    print(describeEnum(state.themeMode));
    state.themeMode == SneakerThemeMode.darkMode
        ? emit(state.copyWith(themeMode: SneakerThemeMode.lightMode))
        : emit(state.copyWith(themeMode: SneakerThemeMode.darkMode));
  }
}
