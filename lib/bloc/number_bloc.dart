import 'package:flutter_app_flutter_bloc/bloc/number_event.dart';
import 'package:flutter_app_flutter_bloc/bloc/number_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberBloc extends Bloc<NumberEvent, NumberState> {
  NumberBloc() : super(EmptyNumberState());

  @override
  Stream<NumberState> mapEventToState(NumberEvent event) async* {
    var _currentState = state;
    if (event is Increment) {
      if(_currentState is LoadedNumberState) {
        yield _currentState.copyWith(_currentState.number + 1);
      }
      else {
        yield LoadedNumberState(1);
      }
    }
    else if (event is Decrement) {
      if(_currentState is LoadedNumberState) {
        yield _currentState.copyWith(_currentState.number - 1);
      }
      else {
        yield LoadedNumberState(-1);
      }
    }
  }
}