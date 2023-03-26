import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:sneaker_shop/src/blocs/blocs.dart';
import 'package:sneaker_shop/src/models/models.dart';

class SneakerImage extends StatefulWidget {
  final int index;
  final Size size;
  final SneakerModel sneaker;
  final SneakerColorSelectorCubit sneakerColorSelectorCubit;
  const SneakerImage({
    super.key,
    required this.index,
    required this.size,
    required this.sneaker,
    required this.sneakerColorSelectorCubit,
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
        milliseconds: 300,
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
              bloc: widget.sneakerColorSelectorCubit,
              builder: (context, state) {
                final sneakerColors = widget.sneaker.sneakerColors;
                for (var sneakerColor in sneakerColors) {
                  if (sneakerColor.color == state.selectedColor) {
                    return FadeTransition(
                      opacity: _animation,
                      child: BlocBuilder<SneakerSizeSelectorCubit,
                          SneakerSizeSelectorState>(
                        builder: (context, state) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                            height: state.sneakerImageSize! *
                                widget.size.height *
                                0.38,
                            width: state.sneakerImageSize! *
                                widget.size.width *
                                0.84,
                            child: Image.asset(
                              sneakerColor.imagePath,
                              height: state.sneakerImageSize! *
                                  widget.size.height *
                                  0.38,
                              width: state.sneakerImageSize! *
                                  widget.size.width *
                                  0.84,
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
                return BlocBuilder<SneakerSizeSelectorCubit,
                    SneakerSizeSelectorState>(
                  builder: (context, state) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                      height:
                          state.sneakerImageSize! * widget.size.height * 0.38,
                      width: state.sneakerImageSize! * widget.size.width * 0.84,
                      child: Image.asset(
                        widget.sneaker.sneakerColors.first.imagePath,
                        height:
                            state.sneakerImageSize! * widget.size.height * 0.38,
                        width:
                            state.sneakerImageSize! * widget.size.width * 0.84,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
