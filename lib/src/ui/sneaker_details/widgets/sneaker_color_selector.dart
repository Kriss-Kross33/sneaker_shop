import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/src/ui/sneaker_details/blocs/blocs.dart';

import '../../../models/models.dart';
import '../../../utils/utils.dart';

class SneakerColorSelector extends StatefulWidget {
  final Color color;
  final SneakerModel sneaker;

  const SneakerColorSelector({
    super.key,
    required this.color,
    required this.sneaker,
  });

  @override
  State<SneakerColorSelector> createState() => _SneakerColorSelectorState();
}

class _SneakerColorSelectorState extends State<SneakerColorSelector> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SneakerColorSelectorCubit, SneakerColorSelectorState>(
      builder: (context, state) {
        //print(state.selectedColor);

        if (state.selectedColor == null &&
            widget.sneaker.sneakerColors.first.color == widget.color) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                context
                    .read<SneakerColorSelectorCubit>()
                    .onSneakerColorSelected(
                      color: widget.color,
                      isSelected: true,
                    );
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  shape: BoxShape.circle,
                  border: Border.all(width: 6, color: AppColor.white),
                ),
                child: Center(
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (state.selectedColor == widget.color) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                context
                    .read<SneakerColorSelectorCubit>()
                    .onSneakerColorSelected(
                      color: widget.color,
                      isSelected: true,
                    );
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  shape: BoxShape.circle,
                  border: Border.all(width: 6, color: AppColor.white),
                ),
                child: Center(
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: state.selectedColor ?? widget.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () {
              context.read<SneakerColorSelectorCubit>().onSneakerColorSelected(
                    color: widget.color,
                    isSelected: true,
                  );
            },
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: widget.color,
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }
}
