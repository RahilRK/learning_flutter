import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/bloc/counter/counter_event.dart';
import 'package:learning_flutter/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {

    on<CounterIncrementEvent>((event, emit) {
      // use `emit` to update the state.
      emit(CounterState(count: state.count+1));
    });

    on<CounterDecrementEvent>((event, emit) {
      // use `emit` to update the state.
      emit(CounterState(count: state.count-1));
    });
  }

  @override
  void onEvent(CounterEvent event) {
    // TODO: implement onEvent
    super.onEvent(event);
    print("onEvent: ${event.toString()}");
  }

  @override
  void onTransition(Transition<CounterEvent, CounterState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    print("onTransition: ${transition.toString()}");
  }

  @override
  void onChange(Change<CounterState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print("onChange: currentState: ${change.currentState.count}, nextState:${change.nextState.count}");
  }
}
