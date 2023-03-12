import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/src/blocs/blocs.dart';
import 'package:sneaker_shop/src/models/models.dart';
import 'package:sneaker_shop/src/ui/sneaker_details/widgets/widgets.dart';
import 'package:sneaker_shop/src/utils/utils.dart';

class SneakerDetailsScreen extends StatelessWidget {
  final SneakerModel sneaker;
  const SneakerDetailsScreen({
    super.key,
    required this.sneaker,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocProvider<SneakerColorSelectorCubit>(
        create: (context) => SneakerColorSelectorCubit(),
        child: Stack(
          children: [
            Positioned(
              right: -size.width * 0.6,
              top: -size.width * 0.3,
              child: Container(
                height: size.height * 0.6,
                width: size.height * 0.6,
                decoration: BoxDecoration(
                  color: AppColor.gold,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      size.height * 0.3,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Align(
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.favorite,
                    size: 50,
                    color: AppColor.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.25,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Text(
                      sneaker.brandName.toUpperCase(),
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColor.white,
                                fontSize: 120.0,
                              ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 90,
              right: 30,
              child: Image.asset(
                sneaker.imagePath,
                height: size.height * 0.38,
                width: size.width * 0.84,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: size.height * 0.57,
              left: 30,
              right: 30,
              child: Column(
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
                  const SneakerSizeList(),
                ],
              ),
            ),
            Positioned(
              bottom: 40,
              left: 30,
              right: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                  Container(
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.gold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
