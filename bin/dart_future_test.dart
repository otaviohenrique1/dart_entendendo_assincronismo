/* Future => Objeto que representa uma variável que só estará disponível no futuro. */

Future<int> myFutureFunc() async {
  await Future.delayed(Duration(seconds: 3));
  print("I have a function in the Future!");
  print(12);
  return 12;
}

void dartFutureTest() {
  myFutureFunc();
}
