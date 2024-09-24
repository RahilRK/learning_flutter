import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/bloc/visibility/counter_event.dart';

import 'counter_state.dart';

class VisibilityBloc extends Bloc<VisibilityEvent, VisibilityState> {
  VisibilityBloc() : super(VisibilityState(show: true)) {

    on<ShowEvent>((event, emit) {
      // use `emit` to update the state.
      emit(VisibilityState(show: true));
    });

    on<HideEvent>((event, emit) {
      // use `emit` to update the state.
      emit(VisibilityState(show: false));
    });
  }
}
