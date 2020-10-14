import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'dart:math';

/**
 * Created by Administrator on 2020/9/29.
 */
void main() {
  // future();
  // futureDelay();
  // futureSync();
  // futureValue();
  // futureWait();
  // futureAny();
  // futureDoWhile();
  // futureForEach();

  // stream();
  // streamFromFuture();
  // streamFromIteratable();
  // streamPeriodic();
  // streamValue();
  // streamDrain();
  // streamAny();
  // streamFold();

  // await();
  // yield();
  isolate();
}

void await() async {

  print('start');

  await Future(()=>1).then((value) => print(value));

  print('end');
}

void streamFold() {
  Stream.fromIterable([1, 4, 2, 6])
      .fold(100, (s, t){
        print('s is $s, t is $t');
        return s + t;})
      .then((value) => print(value));
}

void streamDrain() {
  Stream.fromIterable([1, 4, 2, 6])
      .drain(8)
      .then((value) => print(value));
}

void streamAny() {
  Stream.fromIterable([1, 4, 2, 6]).any((e) {
    print('any|e is $e');
    return e == 4;
  }).then((value) => print(value));
}

void streamPeriodic() {
  Stream.periodic(Duration(seconds: 2), (e) {
    print('t is $e');
    return e;
  }).forEach((element) => print(element));
}

void streamValue() {
  Stream.value(1).forEach((element) => print(element));
}

void streamFromIteratable() {
  Stream.fromIterable([1, 2, 3, 2]).forEach((element) => print(element));
}

void streamFromFuture() {
  Stream.fromFuture(Future(() => [1, 2, 3]))
      .forEach((element) => print(element));
}

void futureForEach() {
  Future.forEach([1, 2, 4, 5, 2], (int e) => print(e))
      .then((value) => print(value));
}

void futureDoWhile() {
  int n = 0;
  Future.doWhile(() {
    print(n++);
    if (n < 4) {
      return true;
    } else {
      return false;
    }
  }).then((value) => print(value));
}

void futureAny() {
  Future<String> future1 = Future.sync(() => 'one');
  Future<String> future2 = Future.sync(() => 'two');
  Future<String> future3 = Future.delayed(Duration(seconds: 2), () => 'three');

  Future.any([future1, future2, future3]).then((value) => print(value));
}

void futureValue() {
  Future.value(1).then((value) => print(value));
}

void futureWait() {
  Future<String> future1 = Future.sync(() => 'one');
  Future<String> future2 = Future.sync(() => 'two');
  Future<String> future3 = Future.delayed(Duration(seconds: 2), () => 'three');

  Future.wait([future1, future2, future3]).then((value) => print(value));
}

void futureThen() {}

void yield() async {
  Stream<int> Function() fun1 = () async* {
    yield 1;
  };

  Stream<int> Function() fun2 = () async* {
    yield* fun1();
  };

  await for (var o in fun2()) {
    print(o);
  }
}

void stream() async {
  //方式一：
  await for (var item in streamInt()) {
    print('item is $item');
  }

  //方式二：使用函数指针
  // Stream<int> Function() stream = () async* {
  //   for (var i = 0; i < 5; ++i) {
  //     yield i;
  //   }
  // };
  //
  // await for(var item in stream()){
  //   print('item is $item');
  // }

  //方式三：使用匿名函数
  // Stream<int> Function() stream = () async* {
  //   for (var i = 0; i < 5; ++i) {
  //     yield i;
  //   }
  // };
  //
  // await for(var item in stream()){
  //   print('item is $item');
  // }

  //方式四：链式调用
  // await for (var item in
  //     () async* { for (var i = 0; i < 5; ++i) {
  //         yield i;
  //     }}
  //     ())
  // { print('item is $item'); }
}

Stream<int> streamInt() async* {
  for (var i = 0; i < 5; ++i) {
    yield i;
  }
}

void isolate() {
  //方式一
  // Isolate.spawn((xx) {
  //   for (var i = 0; i < 99999; ++i) {
  //     print('Isolate2 | $i | n = $xx');
  //   }
  // }, n);
  //
  // for (var i = 0; i < 99999; ++i) {
  //   print('main | $i | n = ${n++}');
  // }


  //方式二
  int n = 0;
  final ISO iso = ISO();
  Isolate.spawn(sk, iso);

  while(n++ < 20){
    sleep(Duration(seconds: 1));
    print('main | n = ${iso.n++}');
  }
}

void sk(ISO msg) {
  int n = 0;
  while(n++ < 10) {
    sleep(Duration(seconds: 1));
    print('Isolate | n = ${msg.n}');
  }
}

void futureDelay() {
  //同步操作
  Future.delayed(Duration(seconds: 2), () => 'go')
      .then((value) => print(value))
      .whenComplete(() => 'done!');
}

void future() {
  Future(() => 11).then((value) => print(value++)).whenComplete(() => null);
}

void futureSync() async {
  Future.sync(() => 1).then((value) => print(value));
}


class ISO {
  int n = 0;
}