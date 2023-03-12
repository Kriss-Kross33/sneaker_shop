part of 'sneaker_color_selector_cubit.dart';

class SneakerColorSelectorState extends Equatable {
  const SneakerColorSelectorState({
    this.selectedColor,
    this.isSelected = false,
  });

  final Color? selectedColor;
  final bool isSelected;

  SneakerColorSelectorState copyWith({
    required Color selectedColor,
    bool? isSelected,
  }) {
    return SneakerColorSelectorState(
      selectedColor: selectedColor,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [selectedColor];
}
