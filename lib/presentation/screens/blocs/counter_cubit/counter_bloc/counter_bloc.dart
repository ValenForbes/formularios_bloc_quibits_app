import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  //Esto es el constructor del CounterBloc
  CounterBloc() : super(const CounterState()) {
    on<CounterIncreased>((_onCounterIncresased));

    on<CounterReset>(_onCounterReset);
  }
  //Esta es la función
  void _onCounterIncresased(
      CounterIncreased event, Emitter<CounterState> emit) {
    //Esto es el Handler dentro de la función
    emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1));
  }

  //Esta es otra función
  void _onCounterReset(CounterReset event, Emitter<CounterState> emit) {
    //Esto es el Handler dentro de la función
    emit(state.copyWith(
      counter: 0,
    ));
  }

  void increaseBy([int value = 1]) {
    add(CounterIncreased(value));
  }

  void resetCounter() {
    add(CounterReset());
  }
}
