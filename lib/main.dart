import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/src/blocs/blocs.dart';
import 'package:sneaker_shop/src/ui/home/home_screen.dart';
import 'package:sneaker_shop/src/utils/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      home: BlocProvider<SneakerCarouselCubit>(
        create: (context) => SneakerCarouselCubit(),
        child: const HomeScreen(),
      ),
    );
  }
}
