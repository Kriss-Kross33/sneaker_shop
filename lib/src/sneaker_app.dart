import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/src/blocs/blocs.dart';
import 'package:sneaker_shop/src/utils/utils.dart';

class SneakerApp extends StatelessWidget {
  const SneakerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SneakerThemeCubit>(
          create: (context) => SneakerThemeCubit(),
        ),
        BlocProvider<SneakerCarouselCubit>(
          create: (context) => SneakerCarouselCubit(),
        ),
        // BlocProvider<SneakerColorSelectorCubit>(
        //   create: (context) => SneakerColorSelectorCubit(),
        // ),
        BlocProvider<SneakerSizeSelectorCubit>(
          create: (context) => SneakerSizeSelectorCubit(),
        ),
      ],
      child: BlocBuilder<SneakerThemeCubit, SneakerThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: state.themeMode == SneakerThemeMode.darkMode
                ? AppTheme.defaultTheme
                : AppTheme.lightTheme,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routerDelegate: AppRouter.router.routerDelegate,
          );
        },
      ),
    );
  }
}
