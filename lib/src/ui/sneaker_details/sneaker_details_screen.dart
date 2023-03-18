import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:sneaker_shop/src/blocs/blocs.dart';
import 'package:sneaker_shop/src/models/models.dart';
import 'package:sneaker_shop/src/ui/sneaker_details/widgets/widgets.dart';
import 'package:sneaker_shop/src/utils/utils.dart';

import 'blocs/blocs.dart';

class SneakerDetailsScreen extends StatelessWidget {
  final SneakerModel sneaker;
  final int index;
  const SneakerDetailsScreen({
    super.key,
    required this.sneaker,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<SneakerColorSelectorCubit>(
            create: (context) => SneakerColorSelectorCubit(),
          ),
          BlocProvider<SneakerSizeSelectorCubit>(
            create: (context) => SneakerSizeSelectorCubit(),
          ),
        ],
        child: Stack(
          children: [
            Positioned(
              right: -size.width * 0.6,
              top: -size.width * 0.3,
              child: TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                  tween: Tween(begin: 0, end: 1),
                  builder: (context, value, _) {
                    return Container(
                      height: value * (size.height * 0.6),
                      width: value * (size.height * 0.6),
                      decoration: BoxDecoration(
                        color: sneaker.color,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            size.height * 0.3,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Positioned(
              top: size.height * 0.25,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  sneaker.brandName.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColor.white,
                        fontSize: 120.0,
                      ),
                ),
              ),
            ),
            Positioned(
              top: 90,
              right: 30,
              child: Hero(
                tag: index,
                child: SimpleShadow(
                  sigma: 5,
                  opacity: 0.4,
                  offset: const Offset(10, 25),
                  child: Image.asset(
                    sneaker.imagePath,
                    height: size.height * 0.38,
                    width: size.width * 0.84,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.57,
              left: 30,
              right: 30,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sneaker.brandName.toUpperCase(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColor.white,
                          fontSize: 22,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          sneaker.model.toUpperCase(),
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.white,
                                    fontSize: 26,
                                  ),
                        ),
                        Text(
                          '\$${sneaker.price.toStringAsFixed(2)}',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.white,
                                    fontSize: 26,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const SneakerRating(),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'SET',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColor.white,
                          fontSize: 18,
                        ),
                  ),
                  SneakerSizeList(
                    sneaker: sneaker,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 40,
              left: 30,
              right: 30,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  SneakerColorSelector(
                    color: AppColor.green,
                  ),
                  SneakerColorSelector(
                    color: AppColor.gold,
                  ),
                  SneakerColorSelector(
                    color: AppColor.cyan,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 40,
              right: 30,
              child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                  builder: (context, value, _) {
                    return Container(
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: sneaker.color,
                      ),
                      child: Center(
                        child: Text(
                          'BUY',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                color: AppColor.black,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    );
                  }),
            ),
            Positioned(
              top: 40,
              left: 20,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                    icon: const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
            ),
            const Positioned(
              top: 40,
              right: 20,
              child: SneakerFavouriteIcon(),
            ),
          ],
        ),
      ),
    );
  }
}
