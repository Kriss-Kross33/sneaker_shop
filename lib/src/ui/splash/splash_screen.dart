import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sneaker_shop/src/blocs/blocs.dart';
import 'package:sneaker_shop/src/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      context.push(RouteConst.homeRoute);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<SneakerThemeCubit, SneakerThemeState>(
          builder: (context, state) {
            if (state.themeMode == SneakerThemeMode.lightMode) {
              return Image.asset(
                AssetConsts.nikeLogoDark,
              );
            }

            return Image.asset(AssetConsts.nikeLogoLight);
          },
        ),
      ),
    );
  }
}
