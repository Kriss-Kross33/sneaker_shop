import 'package:flutter/material.dart';
import 'package:sneaker_shop/src/blocs/blocs.dart';
import 'package:sneaker_shop/src/models/models.dart';
import 'package:sneaker_shop/src/ui/sneaker_details/widgets/widgets.dart';

class SneakerSizeList extends StatelessWidget {
  final SneakerModel sneaker;
  final SneakerColorSelectorCubit sneakerColorSelectorCubit;
  SneakerSizeList({
    super.key,
    required this.sneaker,
    required this.sneakerColorSelectorCubit,
  });

  final sneakerSizes = <double>[7, 7.5, 8, 9];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 45,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SneakerSize(
              size: sneakerSizes[index],
              color: sneaker.sneakerColors.first.color,
              sneakerColorSelectorCubit: sneakerColorSelectorCubit,
            );
          },
          itemCount: sneakerSizes.length,
        ),
      ),
    );
  }
}
