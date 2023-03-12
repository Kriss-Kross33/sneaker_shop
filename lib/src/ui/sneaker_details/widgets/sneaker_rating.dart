import 'package:flutter/material.dart';
import 'package:sneaker_shop/src/utils/utils.dart';

class SneakerRating extends StatelessWidget {
  const SneakerRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(
          5,
          (index) => const Icon(
                Icons.star,
                size: 26,
                color: AppColor.white,
              )).toList(),
    );
  }
}
