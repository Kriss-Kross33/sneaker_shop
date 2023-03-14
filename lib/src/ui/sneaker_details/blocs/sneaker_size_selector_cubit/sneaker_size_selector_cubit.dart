import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sneaker_size_selector_state.dart';

class SneakerSizeSelectorCubit extends Cubit<SneakerSizeSelectorState> {
  SneakerSizeSelectorCubit()
      : super(const SneakerSizeSelectorState(sneakerSize: 7));

  onSneakerSizeSelected(double index) {
    emit(
      state.copyWith(sneakerSize: index),
    );
  }
}
