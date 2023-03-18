import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:sneaker_shop/src/models/models.dart';
import 'package:sneaker_shop/src/ui/sneaker_details/blocs/blocs.dart';

class SneakerImage extends StatefulWidget {
  final int index;
  final Size size;
  final SneakerModel sneaker;
  const SneakerImage({
    super.key,
    required this.index,
    required this.size,
    required this.sneaker,
  });

  @override
  State<SneakerImage> createState() => _SneakerImageState();
}

class _SneakerImageState extends State<SneakerImage>
    with SingleTickerProviderStateMixin<SneakerImage> {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.index,
      child: SimpleShadow(
        sigma: 5,
        opacity: 0.4,
        offset: const Offset(10, 25),
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
          tween: Tween(begin: 0, end: 1),
          builder: (context, value, _) {
            return BlocBuilder<SneakerColorSelectorCubit,
                SneakerColorSelectorState>(
              builder: (context, state) {
                final sneakerColors = widget.sneaker.sneakerColors;
                for (var sneakerColor in sneakerColors) {
                  if (sneakerColor.color == state.selectedColor) {
                    return FadeTransition(
                      opacity: _animation,
                      child: Image.asset(
                        sneakerColor.imagePath,
                        height: widget.size.height * 0.38,
                        width: widget.size.width * 0.84,
                        fit: BoxFit.fill,
                      ),
                    );
                  }
                }
                return Image.asset(
                  widget.sneaker.sneakerColors.first.imagePath,
                  height: widget.size.height * 0.38,
                  width: widget.size.width * 0.84,
                  fit: BoxFit.fill,
                );
              },
            );
          },
        ),
      ),
    );
  }
}