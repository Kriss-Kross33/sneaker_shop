import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/src/blocs/blocs.dart';
import 'package:sneaker_shop/src/models/models.dart';
import 'package:sneaker_shop/src/ui/home/widgets/widgets.dart';

class SneakerCarouselSlider extends StatefulWidget {
  const SneakerCarouselSlider({super.key});

  @override
  State<SneakerCarouselSlider> createState() => _SneakerCarouselSliderState();
}

class _SneakerCarouselSliderState extends State<SneakerCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
          height: size.height * 0.45,
          enlargeCenterPage: true,
          aspectRatio: 2.0,
          enableInfiniteScroll: false,
          viewportFraction: 0.75,
          padEnds: false,
          onPageChanged: (index, _) {
            context.read<SneakerCarouselCubit>().onSneakerCarouselChanged(
                  index: index,
                  sneaker: sneakers[index],
                );
          }),
      items: sneakers
          .map(
            (sneaker) =>
                BlocBuilder<SneakerCarouselCubit, SneakerCarouselState>(
              builder: (context, state) {
                // if (state is SneakerCarouselChangedState) {
                return SneakerCard(
                  sneaker: state.sneaker,
                );
                // }
                // return SneakerCard(
                //   sneaker: sneakers[0],
                // );
              },
            ),
          )
          .toList(),
    );
  }
}
