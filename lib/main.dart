import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sneaker_shop/src/sneaker_app.dart';
import 'package:sneaker_shop/src/utils/utils.dart';

Future<void> main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  binding.addPostFrameCallback((_) async {
    BuildContext context = binding.renderViewElement!;
    for (var asset in AssetConsts.allAssets()) {
      precacheImage(AssetImage(asset), context);
    }
  });
  runApp(const SneakerApp());
}
