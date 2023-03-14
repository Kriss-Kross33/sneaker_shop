import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/src/ui/sneaker_details/blocs/blocs.dart';
import 'package:sneaker_shop/src/utils/utils.dart';

class SneakerSize extends StatelessWidget {
  final double size;
  final bool isSelected;
  final Color? color;
  const SneakerSize({
    super.key,
    required this.size,
    this.isSelected = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(size);
        context.read<SneakerSizeSelectorCubit>().onSneakerSizeSelected(size);
      },
      child: BlocBuilder<SneakerSizeSelectorCubit, SneakerSizeSelectorState>(
          builder: (context, state) {
        return Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: state.sneakerSize != size ? AppColor.white : color,
          ),
          child: Center(
            child: Text(
              '${size.removeTrailingZeros()}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColor.black,
                    fontSize: 24,
                  ),
            ),
          ),
        );
      }),
    );
  }
}
