import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/src/blocs/blocs.dart';
import 'package:sneaker_shop/src/ui/home/widgets/widgets.dart';

import '../../utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 15,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AssetConsts.nikeLogoWhite,
                      width: 50,
                      fit: BoxFit.fill,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.menu,
                      color: AppColor.white,
                      size: 33,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.shopping_bag_outlined,
                      color: AppColor.white,
                      size: 33,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                BlocBuilder<SneakerCarouselCubit, SneakerCarouselState>(
                  builder: (context, state) {
                    return SneakerTabView(
                      selectedColor: state.sneaker.color,
                    );
                  },
                ),
                const SizedBox(
                  height: 100,
                ),
                const SneakerCarouselSlider(),
              ],
            ),
          ),
          const Positioned(
            bottom: 0.0,
            child: BottomNav(),
          ),
        ],
      ),
    );
  }
}
