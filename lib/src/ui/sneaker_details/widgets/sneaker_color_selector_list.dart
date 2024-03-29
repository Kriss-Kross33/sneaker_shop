import 'package:flutter/material.dart';
import 'package:sneaker_shop/src/blocs/blocs.dart';
import 'package:sneaker_shop/src/models/models.dart';
import 'package:sneaker_shop/src/ui/sneaker_details/widgets/widgets.dart';

class SneakerColorSelectorList extends StatefulWidget {
  final Size size;
  final SneakerModel sneaker;
  final SneakerColorSelectorCubit sneakerColorSelectorCubit;

  const SneakerColorSelectorList({
    super.key,
    required this.size,
    required this.sneaker,
    required this.sneakerColorSelectorCubit,
  });

  @override
  State<SneakerColorSelectorList> createState() =>
      _SneakerColorSelectorListState();
}

class _SneakerColorSelectorListState extends State<SneakerColorSelectorList> {
  List<Color> sneakerColors = <Color>[];

  @override
  void initState() {
    getSneakerColors();
    super.initState();
  }

  void getSneakerColors() {
    final colors = widget.sneaker.sneakerColors
        .map((sneakerColor) => sneakerColor.color)
        .toList();
    sneakerColors.addAll(colors);
  }

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
            sneakerColorSelectorCubit: widget.sneakerColorSelectorCubit,
          );
        },
      ),
    );
  }
}
