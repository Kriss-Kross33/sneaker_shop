import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/src/blocs/blocs.dart';
import 'package:sneaker_shop/src/utils/utils.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SneakerCarouselCubit, SneakerCarouselState>(
      builder: (context, state) {
        //  if (state is SneakerCarouselChangedState) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: state.sneaker.color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(42),
              topRight: Radius.circular(42),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.home_outlined,
                  color: AppColor.black,
                  size: 35,
                ),
                Container(
                  height: 54,
                  width: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    border: Border.all(
                      color: AppColor.black,
                      width: 13,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColor.black,
                          width: 5,
                        ),
                      ),
                    ),
                  ),
                ),
                const Icon(
                  Icons.person_2_outlined,
                  color: AppColor.black,
                  size: 35,
                ),
              ],
            ),
          ),
        );
        //   }
        // return Container(
        //   height: 100,
        //   width: MediaQuery.of(context).size.width,
        //   decoration: BoxDecoration(
        //     color: sneakers.first.color,
        //     borderRadius: const BorderRadius.only(
        //       topLeft: Radius.circular(42),
        //       topRight: Radius.circular(42),
        //     ),
        //   ),
        // );
      },
    );
  }
}
