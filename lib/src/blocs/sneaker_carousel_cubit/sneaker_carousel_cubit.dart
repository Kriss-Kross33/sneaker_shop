import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/src/models/models.dart';

part 'sneaker_carousel_state.dart';

class SneakerCarouselCubit extends Cubit<SneakerCarouselState> {
  SneakerCarouselCubit()
      : super(
          SneakerCarouselState(sneaker: sneakers.first),
        );

  void onSneakerCarouselChanged({
    required int index,
    required SneakerModel sneaker,
  }) {
    emit(
      state.copyWith(sneaker: sneaker),
      // SneakerCarouselChangedState(index: index, sneaker: sneaker),
    );
  }
}
