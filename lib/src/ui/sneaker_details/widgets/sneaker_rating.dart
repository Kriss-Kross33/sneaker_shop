import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/src/blocs/blocs.dart';

class SneakerRating extends StatefulWidget {
  final Color color;
  final SneakerColorSelectorCubit sneakerColorSelectorCubit;
  const SneakerRating({
    super.key,
    required this.color,
    required this.sneakerColorSelectorCubit,
  });

  @override
  State<SneakerRating> createState() => _SneakerRatingState();
}

class _SneakerRatingState extends State<SneakerRating> {
  final ratingCount = 4;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(
          5,
          (index) =>
              BlocBuilder<SneakerColorSelectorCubit, SneakerColorSelectorState>(
                bloc: widget.sneakerColorSelectorCubit,
                builder: (context, state) {
                  if (state.selectedColor != null) {
                    return Icon(
                      Icons.star,
                      size: 26,
                      color: state.selectedColor,
                    );
                  }
                  return InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.star,
                      size: 26,
                      color: widget.color,
                    ),
                  );
                },
              )).toList(),
    );
  }
}
