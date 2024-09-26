import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_cubit_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(CounterCubitState(count: 0));

  void increment() {
    return emit(CounterCubitState(count: state.count + 1));
  }

  void decrement() {
    return emit(CounterCubitState(count: state.count - 1));
  }
}
