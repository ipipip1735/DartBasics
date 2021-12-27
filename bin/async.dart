import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'dart:math';

import 'syntax/funtion.dart';

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
  // futureError();

  // stream();
  // streamFromFuture();
  // streamFromIteratable();
  // streamPeriodic();
  // streamValue();
  // streamDrain();
  // streamAny();
  // streamFold();
  // streamListen();
  // streamController();
  // streamControllerSync();
  streamBroadcast();
  // streamBroadcastSync();

  // streamSubscription();

  // await();
  // yield();

  // timer();//使用定时器
}

void streamSubscription() {
  //方式一：取消订阅
  // print('start');
  // Stream<int> stream = streamInt();
  // StreamSubscription<int> subscription = stream.listen(null);
  // subscription.onData((data) {
  //   print('~~onData~~');
  //   if (data == 2) subscription.cancel();
  // });
  // print('end');

  //方式二：暂停订阅（使用懒加载）
  // print('start');
  // late StreamSubscription<int> subscription;
  // subscription = streamInt().listen((event) {
  //   print('~~onData~~');
  //   if (event == 2) subscription.pause();
  // });
  // print('end');
  //
  //
  // Timer(Duration(seconds: 10), (){
  //   print('~~Timer|subscription.resume()~~');
  //   subscription.resume(); //重启订阅
  // });

  //方式三：使用流控制器
  // print('start');
  // late StreamSubscription<int> subscription;
  // subscription = streamInt().listen((event) {
  //   print('~~onData~~');
  //   if (event == 2) subscription.pause(Future(()=>delay(3000)).whenComplete(()=>print('Complete!')));
  // });
  // print('end');

  //方式四：使用订阅器（使用同步发送数据）
  // print('start');
  // late StreamController controller;
  // controller = StreamController(onListen: () {
  //   print('~~StreamController|onListen~~');
  //
  //   for (var i = 0; i < 5; ++i) {
  //     delay(1000);
  //
  //     print('add $i');
  //     controller.add(i);
  //     print('add end');
  //   }
  //
  // }, onPause: () {
  //   print('~~StreamController|onPause~~');
  // }, onResume: () {
  //   print('~~StreamController|onResume~~');
  // }, onCancel: () {
  //   print('~~StreamController|onCancel~~');
  // });
  //
  // late StreamSubscription subscription;
  // subscription = controller.stream.listen((event) {
  //   print('~~StreamSubscription|onData|$event~~');
  //   if (event == 2) subscription.pause(Future.delayed(Duration(seconds: 7)));
  //   delay(3000);
  // });
  //
  // print('end');

  //方式五：使用订阅器（使用异步方式发送数据）
  print('start');
  late StreamController controller;
  controller = StreamController(onListen: () {
    print('~~StreamController|onListen~~');

    //方式一：使用定时器
    Timer.periodic(Duration(seconds: 1), (timer) {
      print('add ${timer.tick}');
      controller.add(timer.tick);
      print('add end');
    });

    //方式二：使用Future
    // for (var i = 0; i < 5; ++i) {
    //   Future(() {
    //     delay(1000);
    //     print('add $i');
    //     controller.add(i);
    //     print('add end');
    //   });
    // }
  }, onPause: () {
    print('~~StreamController|onPause~~');
  }, onResume: () {
    print('~~StreamController|onResume~~');
  }, onCancel: () {
    print('~~StreamController|onCancel~~');
  });

  late StreamSubscription subscription;
  subscription = controller.stream.listen((event) {
    print('~~StreamSubscription|onData|$event~~');
    if (event == 2) subscription.pause(Future.delayed(Duration(seconds: 7)));
  });

  print('end');
}

void streamBroadcastSync() {
  print('start');

  StreamController controller = StreamController(sync: true);
  late Stream stream = controller.stream.asBroadcastStream(
      onListen: (subscription) {
        print('Braodcast|onListen|subscription = $subscription');

        for (var i = 0; i < 5; ++i) {
          Future(() {
            print('add $i');
            controller.add(i);
            delay(1000);
            print('add $i - end');
          });
        }

        // stream.listen((event) => print('Listen3|event = $event'),
        //     onError: (e, stack) => print('e = $e'),
        //     onDone: () => print('Listen3|done!'),
        //     cancelOnError: false);
      },
      onCancel: (subscription) =>
          print('Braodcast|onCancel|subscription = $subscription'));

  print('ADD Listen1 START');
  stream.listen((event) => print('Listen1|event = $event'),
      onError: (e, stack) => print('e = $e'),
      onDone: () => print('Listen1|done!'),
      cancelOnError: false);
  print('ADD Listen1 END');

  print('ADD Listen2 START');
  stream.listen((event) => print('Listen2|event = $event'),
      onError: (e, stack) => print('e = $e'),
      onDone: () => print('Listen2|done!'),
      cancelOnError: false);
  print('ADD Listen2 END');

  delay(2000);
  print('end');
}

void streamBroadcast() {
  //方式一：使用迭代器发送广播
  // print('start');
  // var stream = Stream.fromIterable([1, 2, 3, 2]);
  //
  // stream = stream.asBroadcastStream(
  //     onListen: (subscription) {
  //       print('Braodcast|onListen|subscription = $subscription');
  //
  //       stream.listen((event) => print('Listen3|event = $event'),
  //           onError: (e, stack) => print('e = $e'),
  //           onDone: () => print('Listen3|done!'),
  //           cancelOnError: false);
  //     },
  //     onCancel: (subscription) =>
  //         print('Braodcast|onCancel|subscription = $subscription'));
  //
  // stream.listen((event) => print('Listen1|event = $event'),
  //     onError: (e, stack) => print('e = $e'),
  //     onDone: () => print('Listen1|done!'),
  //     cancelOnError: false);
  //
  // stream.listen((event) => print('Listen2|event = $event'),
  //     onError: (e, stack) => print('e = $e'),
  //     onDone: () => print('Listen2|done!'),
  //     cancelOnError: false);
  //
  // delay(2000);
  // print('end');

  //方式二：使用流控制器发送广播
  print('start');
  StreamController controller = StreamController();

  var stream = controller.stream.asBroadcastStream(
      onListen: (subscription) {
        print('Braodcast|onListen|subscription = $subscription');

        for (var i = 0; i < 5; ++i) {
          Future(() {
            print('add $i');
            controller.add(i);
            delay(1000);
            print('add $i - end');
          });
        }
      },
      onCancel: (subscription) =>
          print('Braodcast|onCancel|subscription = $subscription'));

  stream.listen((event) => print('Listen1|event = $event'),
      onError: (e, stack) => print('e = $e'),
      onDone: () => print('Listen1|done!'),
      cancelOnError: false);

  stream.listen((event) {
    print('Listen2|event = $event');

    if (event == 3)
      stream.listen((event) => print('Listen3|event = $event'),
          onError: (e, stack) => print('e = $e'),
          onDone: () => print('Listen3|done!'),
          cancelOnError: false);
  },
      onError: (e, stack) => print('e = $e'),
      onDone: () => print('Listen2|done!'),
      cancelOnError: false);

  delay(2000);
  print('end');
}

void streamControllerSync() {
  print('start');
  late StreamController<int> controller;
  controller = StreamController(
      onListen: () {
        print('~~StreamController|onListen|subscription~~');
        delay(2000);
        for (var i = 0; i < 5; ++i) {
          Future(() {
            print('add $i');
            controller.add(i);
            delay(1000);
            print('add $i - end');
          });
        }
      },
      sync: true);

  var stream = controller.stream;
  stream.listen((event) {
    delay(10000);
    print('Listen0|event = $event');
  });

  delay(2000);

  print('end');
}

void streamController() {
  print('start');

  //方式一：增加数据
  StreamController<int> controller = StreamController<int>();
  controller.onListen = () {
    print('~~onListen~~');
    for (var i = 0; i < 5; ++i) {
      print('add $i');
      i > 2 ? controller.addError(Exception('xx')) : controller.add(i);
    }
  };
  late StreamSubscription<int> subscription;
  subscription = controller.stream.listen((event) {
    print('event = $event');
  }, onError: (e, stack) {
    print('e = $e');
    subscription.cancel(); //出错时，取消订阅
  }, onDone: () => print('done!'), cancelOnError: false);

  //方式二：增加流
  // late StreamSubscription<int> subscription;
  // subscription = controller.stream.listen((event) {
  //   print('event = $event');
  // }, onError: (e, stack) {
  //   print('e = $e');
  //   subscription.cancel(); //出错时，取消订阅
  // }, onDone: () => print('done!'), cancelOnError: false);
  //
  // controller.addStream(Stream.fromIterable([1, 2, 3, 2]));

  //方式三：使用懒加载
  // late StreamController<int> controller;
  // controller = StreamController<int>(
  //     onListen: () {
  //       print('~~onListen~~');
  //       for (var i = 0; i < 5; ++i) {
  //         print('add $i');
  //         controller.add(i); //增加数据
  //         // controller.addError(Exception('xx'));//增加异常
  //         // controller.addStream(Stream.fromIterable([1, 2, 3, 2]));//增加其他流
  //       }
  //     },
  //     onCancel: () => print('~~onCancel~~'),
  //     onPause: () => print('~~onPause~~'),
  //     onResume: () => print('~~onResume~~'),
  //     sync: true);
  //
  // late StreamSubscription<int> subscription;
  // subscription = controller.stream.listen((event) {
  //   print('event = $event');
  // }, onError: (e, stack) {
  //   print('e = $e');
  //   subscription.cancel();//出错时，取消订阅
  // }, onDone: () => print('done!'), cancelOnError: false);

  delay(2000);
  print('end');
}

void streamListen() {
  print('start');

  //方式一：获取订阅器
  StreamSubscription<int> subscription = Stream.fromIterable([1, 2, 3, 2])
      .listen(null,
          onError: (e) => print('e = $e'),
          onDone: () => print('done!'),
          cancelOnError: false);
  subscription.onData((data) {
    print('data = $data');
    delay(1000);
    // if(event == 3)subscription.pause();//取消订阅
  });

  Timer(Duration(seconds: 1), () {
    print('~~pause()~~');
    subscription.resume(); //重启订阅
  });

//方式二：使用懒加载获取订阅器
// late StreamSubscription<int> subscription;
// subscription = Stream.fromIterable([1, 2, 3, 2]).listen((event) {
//   print('event = $event');
//   delay(1000);
//   // if(event == 3)subscription.pause();//取消订阅
// },
//     onError: (e) => print('e = $e'),
//     onDone: () => print('done!'),
//     cancelOnError: false);
//
// Timer(Duration(seconds: 1), (){
//   print('~~pause()~~');
//   subscription.resume();//重启订阅
// });

//错误处理
// late StreamController controller;
// controller = StreamController(
//     onListen: () {
//       print('~~onListen~~');
//       for (var i = 0; i < 5; ++i) {
//         i < 2 ? controller.add(i) : controller.addError(Exception('xxx'));
//       }
//     },
//     onCancel: () => print('~~onCancel~~'));
// controller.stream.listen((event) => print('event = $event'),
//     onError: (e) => print('e = $e'),
//     onDone: () => print('done!'),
//     cancelOnError: true);

  delay(2000);
  print('end');
}

void timer() {
  //延迟任务
  // Timer(Duration(seconds: 3), () => print('run'));
  Timer.run(() => print('run'));

  //周期任务
  int n = 0;
  // Timer.periodic(Duration(seconds: 1), (timer) {
  //   print('start');
  //   if(n == 5)timer.cancel();
  //   print('n = ${n++}');
  //   print('end');
  // });
}

await() async {
  print('~~await~~');
  print('start');
  var r = await Future(() => 1).then((value) => value);
  print('r = $r');
  print('end');
}

void streamFold() {
  Stream.fromIterable([1, 4, 2, 6]).fold(100, (s, t) {
    print('s is $s, t is $t');
    // return s + t;
  }).then((value) => print(value));
}

void streamDrain() {
  Stream.fromIterable([1, 4, 2, 6]).drain(8).then((value) => print(value));
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
  var future = Future.value(2);

  print('future = $future');
  delay(3000);
}

void futureWait() {
  Future<String> future0 = Future.delayed(Duration(seconds: 2), () => 'zero');
  Future<String> future1 = Future.sync(() => 'one');
  Future<String> future2 = Future.sync(() => 'two');

  var future =
      Future.wait([future0, future1, future2]).then((value) => print(value));

  print('future = $future');
  delay(3000);
}

void yield() async {
  Stream<int> Function() fun1 = () async* {
    for (var i = 0; i < 5; ++i) {
      delay(1000);
      yield i;
    }
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
  // await for (var item in streamInt()) {
  //   print('item is $item');
  // }

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

  //方式三：链式调用
  // await for (var item in
  //     () async* { for (var i = 0; i < 5; ++i) {
  //         yield i;
  //     }}
  //     ())
  // { print('item is $item'); }

  //使用流控制器
  var controller = StreamController<int>();
  for (var i = 0; i < 5; ++i) {
    print('add $i');
    controller.add(i);
    delay(1000);
  }
  controller.stream.forEach((element) => print('element = $element'));
}

Stream<int> streamInt() async* {
  for (var i = 0; i < 10; ++i) {
    delay(1000);
    print('yield $i');
    yield i;
    print('yield end');
  }
}

Iterable iterableInt() sync* {
  for (var i = 0; i < 5; ++i) {
    delay(1000);
    print('send $i');
    yield i;
  }
}

void futureDelay() {
  //同步操作
  var future = Future.delayed(Duration(seconds: 2), () => 'go')
      .then((value) => print(value));
  delay(3000);
  print('future = $future');
}

void futureError() {
  //错误处理（使用then()方法的onError）
  // var future = Future(() {
  //   throw Error();
  // }).then((value) {
  //   print('value is $value');
  // }, onError: (e) {
  //   print('e is $e');
  // });

  //错误处理（使用catchError）
  // var future = Future(() {
  //   throw Exception('XXX');
  //   return 11;
  // }).then((v){
  //   print('then|v is $v');
  //   throw Exception('XXX');
  //   return 11;
  // }, onError: (e){
  //   print('onError|e is $e');
  //   throw Exception('onError|XXX');
  // }).catchError((e) {
  //   print('catchError|e is $e');
  //   return 44;
  // });

  // var future = Future(() {
  //   throw Exception('XXX');
  //   return 11;
  // }).then((v){
  //   print('then|v is $v');
  //   throw Exception('XXX');
  //   return 11;
  // }).catchError((e) {
  //   print('catchError|e is $e');
  //   return 44;
  // }, test: (e) {
  //   print('catchError-test|e = $e');
  //   return false;
  // });

  //错误处理（whenComplete）
  var future = Future(() {
    throw Exception('XXX');
    return 0;
  }).then((value) {
    print('then|1|v is $value');
    throw Exception('one');
    return 11;
  }).then((value) {
    print('then|2|v is $value');
    throw Exception('two');
    return 22;
  }).then((value) {
    print('then|3|v is $value');
    throw Exception('three');
    return 33;
  }).catchError((e) {
    print('e = $e');
    return 100;
  }).whenComplete(() {
    print('~~whenComplete~~');
  });

  // delay(3000);
  // print('future = $future');
}

void future() {
  //任务链
  // var future = Future(() {
  //   print('~~Future~~');
  //   delay(3000);
  //   return 1;
  // }).then((value) {
  //   delay(3000);
  //   print('then1|value is $value');
  // }).then((value) => print('then2|value = $value'));
  //
  // delay(3000);
  // print('future = $future');
}

void futureSync() async {
  print('start');
  var future = Future.sync(() {
    print('~~Future.sync()~~');
    delay(2000);
    return 11;
  }).then((value) => print('Future.then()|value = $value'));
  print('future = $future');
  delay(3000);
  print('end');
}

delay(int n) {
  var timestamp = DateTime.now().millisecondsSinceEpoch;
  // print('timestamp = $timestamp');
  while (true) {
    if (DateTime.now().millisecondsSinceEpoch - timestamp > n) {
      // print('DateTime.now().millisecondsSinceEpoch = ${DateTime.now().millisecondsSinceEpoch}');
      break;
    }
  }
}
