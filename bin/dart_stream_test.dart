/* Stream => Objeto que recebe uma sequência de dados/eventos assíncronos. */

Stream<int> timedCounter(int interval, [int? maxCount]) async* {
  int i = 1;
  while (i != maxCount) {
    await Future.delayed(Duration(seconds: interval));
  }
  yield i++;
}

void dartStreamTest() {
  timedCounter(5, 10);
}
