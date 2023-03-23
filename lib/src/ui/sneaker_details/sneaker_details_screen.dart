import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/src/blocs/blocs.dart';
import 'package:sneaker_shop/src/models/models.dart';
import 'package:sneaker_shop/src/ui/sneaker_details/widgets/widgets.dart';
import 'package:sneaker_shop/src/utils/utils.dart';

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
      body: Stack(
        children: [
          Positioned(
            right: -size.width * 0.6,
            top: -size.width * 0.3,
            child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
                tween: Tween(begin: 0, end: 1),
                builder: (context, value, _) {
                  return BlocBuilder<SneakerColorSelectorCubit,
                      SneakerColorSelectorState>(
                    builder: (context, state) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: value * (size.height * 0.6),
                        width: value * (size.height * 0.6),
                        decoration: BoxDecoration(
                          color: state.selectedColor ??
                              sneaker.sneakerColors.first.color,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              size.height * 0.3,
                            ),
                          ),
                        ),
                      );
                    },
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
                      color: Theme.of(context).primaryColor,
                      fontSize: 120.0,
                    ),
              ),
            ),
          ),
          Positioned(
            top: 90,
            right: 30,
            child: SneakerImage(
              index: index,
              size: size,
              sneaker: sneaker,
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
                        color: Theme.of(context).primaryColor,
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
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColor,
                              fontSize: 26,
                            ),
                      ),
                      Text(
                        '\$${sneaker.price.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColor,
                              fontSize: 26,
                            ),
                      ),
                    ],
                  ),
                ),
                SneakerRating(
                  color: sneaker.sneakerColors.first.color,
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'SET',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor,
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
            bottom: 50,
            left: 30,
            right: 30,
            child: SneakerColorSelectorList(
              size: size,
              sneaker: sneaker,
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
                  return BlocBuilder<SneakerColorSelectorCubit,
                      SneakerColorSelectorState>(
                    builder: (context, state) {
                      if (state.selectedColor != null) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: state.selectedColor,
                          ),
                          child: Center(
                            child: Text(
                              'BUY',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        );
                      }
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: sneaker.sneakerColors.first.color,
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
                    },
                  );
                }),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Theme.of(context).colorScheme.onSecondary,
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
    );
  }
}
