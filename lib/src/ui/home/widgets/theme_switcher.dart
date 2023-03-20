import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/src/blocs/blocs.dart';

class ThemeSwitcherIcon extends StatelessWidget {
  const ThemeSwitcherIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<SneakerThemeCubit>().onThemeModeChanged();
      },
      child: BlocBuilder<SneakerThemeCubit, SneakerThemeState>(
        builder: (context, state) {
          if (state.themeMode == SneakerThemeMode.darkMode) {
            return Icon(
              Icons.light_mode,
              color: Theme.of(context).buttonTheme.colorScheme?.primary,
              size: 33,
            );
          }
          return Icon(
            Icons.dark_mode,
            color: Theme.of(context).buttonTheme.colorScheme?.primary,
            size: 33,
          );
        },
      ),
    );
  }
}
