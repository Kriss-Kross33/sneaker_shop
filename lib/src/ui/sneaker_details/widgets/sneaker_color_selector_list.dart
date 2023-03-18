import 'package:flutter/material.dart';
import 'package:sneaker_shop/src/models/models.dart';
import 'package:sneaker_shop/src/ui/sneaker_details/widgets/widgets.dart';

import '../../../utils/utils.dart';

class SneakerColorSelectorList extends StatefulWidget {
  final Size size;
  final SneakerModel sneaker;

  const SneakerColorSelectorList({
    super.key,
    required this.size,
    required this.sneaker,
  });

  @override
  State<SneakerColorSelectorList> createState() =>
      _SneakerColorSelectorListState();
}

class _SneakerColorSelectorListState extends State<SneakerColorSelectorList> {
  List<Color> sneakerColors = <Color>[
    AppColor.green,
    AppColor.gold,
    AppColor.cyan,
    AppColor.red,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: widget.size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sneakerColors.length,
        itemBuilder: (context, index) {
          return SneakerColorSelector(
            color: sneakerColors[index],
            sneaker: widget.sneaker,
          );
        },
      ),
    );
  }
}
