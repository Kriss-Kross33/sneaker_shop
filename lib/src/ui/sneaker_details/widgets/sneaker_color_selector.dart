import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/src/blocs/blocs.dart';

class SneakerColorSelector extends StatefulWidget {
  final Color color;

  const SneakerColorSelector({
    super.key,
    required this.color,
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
              // height: 30,
              // width: 30,
              decoration:
                  // state.selectedColor == null ||
                  //         state.selectedColor != widget.color
                  //     ? null
                  //     :
                  const BoxDecoration(
                      //  color: AppColor.white,
                      //borderRadius: BorderRadius.circular(15),
                      ),
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
