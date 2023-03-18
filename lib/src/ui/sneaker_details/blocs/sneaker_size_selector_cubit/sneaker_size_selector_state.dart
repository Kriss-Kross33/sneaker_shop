part of 'sneaker_size_selector_cubit.dart';

class SneakerSizeSelectorState extends Equatable {
  const SneakerSizeSelectorState({required this.sneakerSize});

  final double sneakerSize;

  SneakerSizeSelectorState copyWith({double? sneakerSize}) {
    return SneakerSizeSelectorState(
      sneakerSize: sneakerSize ?? this.sneakerSize,
    );
  }

  @override
  List<Object> get props => [
        sneakerSize,
      ];
}
