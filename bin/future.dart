void aula1() {
  // ignore: unused_local_variable
  Future myFuture = Future(() {
    print("Going back to the future");
    return 21;
  }).then((value) => print("$value"));
  print("Done with main");
}

void aula2() {
  // ignore: unused_local_variable
  Future myFuture = Future(() {
    print("Going back to the future");
    return 21;
  }).then((value) => print("$value"));
  Future.delayed(Duration(seconds: 5));
  print("Done with main");
}

void aula3() {
  Future.delayed(Duration(seconds: 5));
  print("");

  Future<int> myFutureFunction() async {
    await Future.delayed(Duration(seconds: 5));
    return 12;
  }

  myFutureFunction().then((value) => print("My function value is: $value"));
}

void aula4() {
  // Forma assincrona
  Future<int> myFutureFunction() async {
    await Future.delayed(Duration(seconds: 5));
    throw Exception();
    // return 12;
  }

  myFutureFunction()
      .then((value) => print("My function value is: $value"))
      .onError((error, stackTrace) {
    // onError() => Pega o erro
    print('An Error occurred');
    print("----------");
    print("--Error--");
    print(error);
    print("----------");
    print("--stackTrace--");
    print(stackTrace);
    print("----------");
  }).whenComplete(() {
    // finaliza o erro
    print("The Future is Over");
  });
}

void aula5() {
  Future<int> myFutureErrorFunction(int a, int b) async {
    try {
      if (a > b) {
        throw Exception();
      }
      print('I am a Functional Function');
      await Future.delayed(Duration(seconds: 5));

      return 42;
    } catch (e) {
      print("An Error occurred: $e");
      return 42;
    } finally {
      print("The Future is finally Over");
    }
  }

  myFutureErrorFunction(5, 2).then((value) => print("The value is : $value"));

  print("Done with main");
}

/*
  Future.delayed(Duration(seconds: 5));
  parecido com o 'settimeout(() = {}, 5000);' do javascript e do typescript
*/

void main(List<String> args) {
  aula5();
}
