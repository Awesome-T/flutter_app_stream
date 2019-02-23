import 'dart:async';
import 'dart:math';

class TestBloc{

  int counter = 0;

  Stream <int> getPeriodicStream() async* {

    counter++;
    yield* Stream.periodic(Duration(seconds: 1),(_) {
      var value = new Random().nextInt(100);
      return value;
    });

  }
}
