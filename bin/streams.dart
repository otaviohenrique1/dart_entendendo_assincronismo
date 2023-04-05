/* async* => objeto fica aberto ate que ele seja fechado */

import 'dart:async';

void aula1Stream() {
  Stream<int> myStream(int interval, [int? maxCount]) async* {
    int i = 1;
    while (i != maxCount) {
      print("Counting: $i");
      await Future.delayed(Duration(seconds: interval));
      yield i++;
    }
  }

  myStream(1, 10);

  print("Main is finished");
}

void aula2Stream() {
  Stream<int> myStream(int interval, [int? maxCount]) async* {
    int i = 1;
    while (i != maxCount) {
      print("Counting: $i");
      await Future.delayed(Duration(seconds: interval));
      yield i++;
    }
  }

  StreamSubscription mySubscribe = myStream(1, 10).listen((event) {
    if (event.isEven) {
      print("This number is Even!");
    }
  });

  print("Main is finished");
}

void aula3Stream() {
  Stream<int> myStream(int interval, [int? maxCount]) async* {
    int i = 1;
    while (i != maxCount) {
      print("Counting: $i");
      await Future.delayed(Duration(seconds: interval));
      yield i++;
    }
  }

  StreamSubscription mySubscribe = myStream(1, 10).listen(
    (event) {
      if (event.isEven) {
        // Verifica se o numero é par.
        print("This number is Even!");
      }
    },
    onError: (e) {
      print("An error happend: $e");
    },
    onDone: () {
      print("The subscriber is gone.");
    },
  );

  print("Main is finished");
}

void aula4Stream() async {
  Stream<int> myStream(int interval, [int? maxCount]) async* {
    int i = 1;
    while (i != maxCount) {
      print("Counting: $i");
      await Future.delayed(Duration(seconds: interval));
      yield i++;
    }
  }

  StreamSubscription mySubscribe = myStream(1).listen(
    (event) {
      if (event.isEven) {
        // Verifica se o numero é par.
        print("This number is Even!");
      }
    },
    onError: (e) {
      print("An error happend: $e");
    },
    onDone: () {
      print("The subscriber is gone.");
    },
  );

  await Future.delayed(Duration(seconds: 3));
  mySubscribe.pause();
  print("Stream pause");

  await Future.delayed(Duration(seconds: 3));
  mySubscribe.resume();
  print("Stream resume");

  await Future.delayed(Duration(seconds: 3));
  mySubscribe.cancel();
  print("Stream cancel");

  print("Main is finished");
}

void aula5Stream() async {
  Stream<int> myStream(int interval, [int? maxCount]) async* {
    int i = 1;
    while (i != maxCount) {
      print("Counting: $i");
      await Future.delayed(Duration(seconds: interval));
      yield i++;
    }
  }

  var kakoStream = myStream(1).asBroadcastStream();
  // .asBroadcastStream() => Para quando varios subscribers estao vendo a Stream

  StreamSubscription mySubscribe = kakoStream.listen(
    (event) {
      if (event.isEven) {
        // Verifica se o numero é par.
        print("This number is Even!");
      }
    },
    onError: (e) {
      print("An error happend: $e");
    },
    onDone: () {
      print("The subscriber is gone.");
    },
  );

  kakoStream
      .map((event) => "Subscriber 2 watching>: $event")
      .listen(print); // Outro subscriber vendo a stream

  await Future.delayed(Duration(seconds: 3));
  mySubscribe.pause();
  print("Stream pause");

  await Future.delayed(Duration(seconds: 3));
  mySubscribe.resume();
  print("Stream resume");

  await Future.delayed(Duration(seconds: 3));
  mySubscribe.cancel();
  print("Stream cancel");

  print("Main is finished");
}

void main(List<String> args) {
  aula5Stream();
}
