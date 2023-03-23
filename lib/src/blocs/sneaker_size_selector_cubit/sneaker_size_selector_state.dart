part of 'sneaker_size_selector_cubit.dart';

class SneakerSizeSelectorState extends Equatable {
  const SneakerSizeSelectorState({
    required this.sneakerSize,
    required this.sneakerImageSize,
  });

  final double sneakerSize;
  final double? sneakerImageSize;

  SneakerSizeSelectorState copyWith({
    double? sneakerSize,
    double? sneakerImageSize,
  }) {
    return SneakerSizeSelectorState(
      sneakerSize: sneakerSize ?? this.sneakerSize,
      sneakerImageSize: sneakerImageSize ?? this.sneakerImageSize,
    );
  }

  @override
  List<Object> get props => [
        sneakerSize,
      ];
}
