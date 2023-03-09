import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/src/models/models.dart';

part 'sneaker_carousel_state.dart';

class SneakerCarouselCubit extends Cubit<SneakerCarouselState> {
  SneakerCarouselCubit()
      : super(
          const SneakerCarouselInitialState(),
        );

  void onSneakerCarouselChanged({
    required int index,
    required SneakerModel sneaker,
  }) {
    emit(
      SneakerCarouselChangedState(index: index, sneaker: sneaker),
    );
  }
}
