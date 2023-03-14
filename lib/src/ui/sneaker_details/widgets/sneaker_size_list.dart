import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/src/models/models.dart';
import 'package:sneaker_shop/src/ui/sneaker_details/blocs/blocs.dart';
import 'package:sneaker_shop/src/ui/sneaker_details/widgets/widgets.dart';

class SneakerSizeList extends StatelessWidget {
  final SneakerModel sneaker;
  const SneakerSizeList({
    super.key,
    required this.sneaker,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <double>[7, 7.5, 8, 9]
          .map(
            (size) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: BlocProvider<SneakerSizeSelectorCubit>(
                create: (context) => SneakerSizeSelectorCubit(),
                child: SneakerSize(
                  size: size,
                  color: sneaker.color,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
