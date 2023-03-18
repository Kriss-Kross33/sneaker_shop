import 'package:flutter/material.dart';
import 'package:sneaker_shop/src/utils/utils.dart';

class SneakerFavouriteIcon extends StatefulWidget {
  const SneakerFavouriteIcon({super.key});

  @override
  State<SneakerFavouriteIcon> createState() => _SneakerFavouriteIconState();
}

class _SneakerFavouriteIconState extends State<SneakerFavouriteIcon>
    with SingleTickerProviderStateMixin<SneakerFavouriteIcon> {
  late AnimationController _controller;
  late Animation _animation;
  late Animation _sizeAnimation;

  bool isFavSelected = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
    );
    _animation = ColorTween(
      begin: AppColor.white,
      end: Colors.red,
    ).animate(_controller);
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween(begin: 50, end: 60), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 60, end: 50), weight: 40),
    ]).animate(_controller);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFavSelected = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          isFavSelected = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        return InkWell(
          onTap: _onFavouriteIconClicked,
          child: Icon(
            Icons.favorite,
            size: _sizeAnimation.value,
            color: _animation.value,
          ),
        );
      },
    );
  }

  _onFavouriteIconClicked() {
    isFavSelected ? _controller.reverse() : _controller.forward();
  }
}
