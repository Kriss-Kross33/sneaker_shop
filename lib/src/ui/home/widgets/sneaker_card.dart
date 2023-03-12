import 'package:flutter/material.dart';
import 'package:sneaker_shop/src/ui/sneaker_details/sneaker_details_screen.dart';
import 'package:sneaker_shop/src/utils/utils.dart';

import '../../../models/models.dart';

class SneakerCard extends StatefulWidget {
  final SneakerModel sneaker;
  const SneakerCard({
    super.key,
    required this.sneaker,
  });

  @override
  State<SneakerCard> createState() => _SneakerCardState();
}

class _SneakerCardState extends State<SneakerCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var brandName = widget.sneaker.brandName.toUpperCase();
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, _) {
            return SneakerDetailsScreen(
              sneaker: widget.sneaker,
            );
          },
        ),
      ),
      child: Container(
        height: size.height * 0.45,
        width: size.width * 0.6,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(
            40,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.sneaker.brandName.toUpperCase(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                        ),
                  ),
                  Text(
                    widget.sneaker.model.toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                          fontSize: 20,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$${widget.sneaker.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                          fontSize: 20,
                        ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${brandName.split(' ').first} \n${brandName.split(' ').last}',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColor.grey,
                                fontSize: 62.0,
                                letterSpacing: -0.2,
                              ),
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            //   child:
            // ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: 65,
                width: 80,
                decoration: BoxDecoration(
                  color: widget.sneaker.color,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
                child: const Center(
                    child: Icon(
                  Icons.add,
                  color: AppColor.white,
                  size: 40,
                )),
              ),
            ),
            Positioned(
              top: 85,
              left: 17,
              child: Container(
                height: 235,
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        widget.sneaker.imagePath,
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              // child: Image.asset(
              //   AssetConsts.nikeAirJordanYellow,
              //),
            ),
          ],
        ),
      ),
    );
  }
}
