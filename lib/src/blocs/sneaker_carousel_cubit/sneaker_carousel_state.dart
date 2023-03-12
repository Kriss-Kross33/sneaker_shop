part of 'sneaker_carousel_cubit.dart';

// class SneakerCarouselState extends Equatable {
//   // final int index;
//   // final SneakerModel? sneaker;
//   // const SneakerCarouselState({
//   //   required this.index,
//   //   this.sneaker,
//   // });
//   const SneakerCarouselState();

//   // @override
//   // List<Object?> get props => [index, sneaker];

//   @override
//   List<Object> get props => [];
// }

class SneakerCarouselState extends Equatable {
  // final int index;
  final SneakerModel sneaker;
  // const SneakerCarouselState({
  //   required this.index,
  //   this.sneaker,
  // });
  const SneakerCarouselState({required this.sneaker});

  SneakerCarouselState copyWith({SneakerModel? sneaker}) {
    return SneakerCarouselState(
      sneaker: sneaker ?? this.sneaker,
    );
  }

  @override
  List<Object> get props => [sneaker];
}

// class SneakerCarouselInitialState extends SneakerCarouselState {
//   const SneakerCarouselInitialState();
// }

// class SneakerCarouselChangedState extends SneakerCarouselState {
//   final int index;
//   final SneakerModel sneaker;
//   const SneakerCarouselChangedState({
//     required this.index,
//     required this.sneaker,
//   });

//   @override
//   List<Object> get props => [index, sneaker];
// }
