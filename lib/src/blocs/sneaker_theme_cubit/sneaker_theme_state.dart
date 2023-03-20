part of 'sneaker_theme_cubit.dart';

class SneakerThemeState extends Equatable {
  final SneakerThemeMode themeMode;
  const SneakerThemeState({
    this.themeMode = SneakerThemeMode.darkMode,
  });

  SneakerThemeState copyWith({SneakerThemeMode? themeMode}) {
    return SneakerThemeState(themeMode: themeMode ?? this.themeMode);
  }

  @override
  List<Object> get props => [themeMode];
}

enum SneakerThemeMode {
  darkMode,
  lightMode,
}
