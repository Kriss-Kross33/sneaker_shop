import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/src/blocs/blocs.dart';
import 'package:sneaker_shop/src/utils/utils.dart';

class SneakerSize extends StatefulWidget {
  final double size;
  final bool isSelected;
  final Color? color;
  final SneakerColorSelectorCubit sneakerColorSelectorCubit;
  const SneakerSize({
    super.key,
    required this.size,
    this.isSelected = false,
    this.color,
    required this.sneakerColorSelectorCubit,
  });

  @override
  State<SneakerSize> createState() => _SneakerSizeState();
}

class _SneakerSizeState extends State<SneakerSize> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(
        onTap: () {
          context
              .read<SneakerSizeSelectorCubit>()
              .onSneakerSizeSelected(widget.size);
        },
        child: BlocBuilder<SneakerSizeSelectorCubit, SneakerSizeSelectorState>(
            builder: (context, state) {
          if (state.sneakerSize == widget.size) {
            return BlocBuilder<SneakerColorSelectorCubit,
                SneakerColorSelectorState>(
              bloc: widget.sneakerColorSelectorCubit,
              builder: (context, state) {
                if (state.selectedColor != null) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: state.selectedColor,
                    ),
                    child: Center(
                      child: Text(
                        '${widget.size.removeTrailingZeros()}',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                ),
                      ),
                    ),
                  );
                }
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: widget.color,
                  ),
                  child: Center(
                    child: Text(
                      '${widget.size.removeTrailingZeros()}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor,
                            fontSize: 24,
                          ),
                    ),
                  ),
                );
              },
            );
          }
          return Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: AppColor.white),
            child: Center(
              child: Text(
                '${widget.size.removeTrailingZeros()}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColor.black,
                      fontSize: 24,
                    ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
