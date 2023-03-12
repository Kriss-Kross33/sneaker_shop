import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sneaker_color_selector_state.dart';

class SneakerColorSelectorCubit extends Cubit<SneakerColorSelectorState> {
  SneakerColorSelectorCubit() : super(const SneakerColorSelectorState());

  void onSneakerColorSelected(
      {required Color color, required bool isSelected}) {
    emit(
      state.copyWith(
        selectedColor: color,
        isSelected: isSelected,
      ),
    );
  }
}
