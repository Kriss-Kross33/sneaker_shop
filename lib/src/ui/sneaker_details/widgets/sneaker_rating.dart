import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/src/blocs/blocs.dart';

class SneakerRating extends StatelessWidget {
  final Color color;
  const SneakerRating({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(
          5,
          (index) =>
              BlocBuilder<SneakerColorSelectorCubit, SneakerColorSelectorState>(
                builder: (context, state) {
                  if (state.selectedColor != null) {
                    return Icon(
                      Icons.star,
                      size: 26,
                      color: state.selectedColor,
                    );
                  }
                  return Icon(
                    Icons.star,
                    size: 26,
                    color: color,
                  );
                },
              )).toList(),
    );
  }
}
