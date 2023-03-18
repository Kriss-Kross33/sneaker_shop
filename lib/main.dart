import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/src/blocs/blocs.dart';
import 'package:sneaker_shop/src/ui/home/home_screen.dart';
import 'package:sneaker_shop/src/utils/utils.dart';

import 'src/ui/sneaker_details/blocs/blocs.dart';

void main() {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);

  binding.addPostFrameCallback((_) async {
    BuildContext context = binding.renderViewElement!;
    for (var asset in AssetConsts.allAssets()) {
      precacheImage(AssetImage(asset), context);
    }
  });
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SneakerCarouselCubit>(
          create: (context) => SneakerCarouselCubit(),
        ),
        BlocProvider<SneakerColorSelectorCubit>(
          create: (context) => SneakerColorSelectorCubit(),
        ),
        BlocProvider<SneakerSizeSelectorCubit>(
          create: (context) => SneakerSizeSelectorCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.defaultTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
