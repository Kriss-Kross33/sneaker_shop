import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sneaker_size_selector_state.dart';

class SneakerSizeSelectorCubit extends Cubit<SneakerSizeSelectorState> {
  SneakerSizeSelectorCubit()
      : super(
          const SneakerSizeSelectorState(sneakerSize: 8, sneakerImageSize: 0.9),
        );

  onSneakerSizeSelected(double index) {
    final sneakerImageSize = getSneakerImageSize(index);
    print(sneakerImageSize);
    emit(
      state.copyWith(
        sneakerSize: index,
        sneakerImageSize: sneakerImageSize,
      ),
    );
  }

  double getSneakerImageSize(double sneakerSize) {
    if (sneakerSize == 7) {
      return 0.85;
    } else if (sneakerSize == 7.5) {
      return 0.9;
    } else if (sneakerSize == 8) {
      return 1;
    } else {
      return 1.1;
    }
  }
}
