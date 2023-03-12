part of 'sneaker_carousel_cubit.dart';

class SneakerCarouselState extends Equatable {
  final SneakerModel sneaker;

  const SneakerCarouselState({required this.sneaker});

  SneakerCarouselState copyWith({SneakerModel? sneaker}) {
    return SneakerCarouselState(
      sneaker: sneaker ?? this.sneaker,
    );
  }

  @override
  List<Object> get props => [sneaker];
}
