import 'package:flutter/material.dart';
import 'package:sneaker_shop/src/utils/utils.dart';

class SneakerSize extends StatelessWidget {
  final double size;
  const SneakerSize({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.white,
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
  }
}
