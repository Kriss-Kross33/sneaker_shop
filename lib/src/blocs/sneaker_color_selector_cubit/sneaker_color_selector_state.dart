part of 'sneaker_color_selector_cubit.dart';

class SneakerColorSelectorState extends Equatable {
  const SneakerColorSelectorState({
    this.selectedColor,
  });

  final Color? selectedColor;

  SneakerColorSelectorState copyWith({
    required Color selectedColor,
    bool? isSelected,
  }) {
    return SneakerColorSelectorState(
      selectedColor: selectedColor,
    );
  }

  @override
  List<Object?> get props => [selectedColor];
}
