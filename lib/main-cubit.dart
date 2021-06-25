import 'dart:async';

import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  //init counter at zero
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
}

void main(List<String> args) async {
  final cubit = CounterCubit();

  final StreamSubscription = cubit.listen(print);
  // subscribes to the cubit state stream and prints
  // the state values emitted by it

  cubit.increment();
  // will increment to 1
  cubit.increment();
  // will icncrement to 2

  await Future.delayed(Duration.zero);
  // Use this to not cancel the subscription
  // immediately down here

  await StreamSubscription.cancel();
  await cubit.close();
}
