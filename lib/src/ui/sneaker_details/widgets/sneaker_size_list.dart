import 'package:flutter/material.dart';
import 'package:sneaker_shop/src/ui/sneaker_details/widgets/widgets.dart';

class SneakerSizeList extends StatelessWidget {
  const SneakerSizeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <double>[7, 7.5, 8, 9]
          .map(
            (size) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SneakerSize(
                size: size,
              ),
            ),
          )
          .toList(),
    );
  }
}
