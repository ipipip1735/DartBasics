import 'dart:io';
import 'dart:isolate';

/**
 * Created by Administrator on 2020/10/21.
 */

///Isolate是dart的子线程，但不能共享内存
// void main() {
//   //方式一：传递简单类型
//   // int message = 0;
//   // Isolate.spawn(entryPoint, message);//n传递的是副本，不是引用
//   //
//   // for (var i = 0; i < 10; ++i) {
//   //   sleep(Duration(seconds: 2));
//   //   print('main | $i | message = ${message++}');
//   // }
//
//
//   //方式二：传递对象
//   int n = 0;
//   ISO iso = ISO();
//   print('iso.hashCode = ${iso.hashCode}');
//   Isolate.spawn(entryPointWithObject, iso);//iso传递的是对象的副本，不是引用，isolate内存是独立的
//
//   while(n++ < 20){
//     sleep(Duration(seconds: 1));
//     print('main | n = ${iso.n++}');
//   }
// }
//
//
// void entryPoint(int message){
//   for (var i = 0; i < 10; ++i) {
//     sleep(Duration(seconds: 1));
//     print('Isolate | $i | n = $message');
//   }
// }

void entryPointWithObject(ISO msg) {
  print('msg.hashCode = ${msg.hashCode}');

  int n = 0;
  while (n++ < 10) {
    sleep(Duration(seconds: 1));
    print('Isolate | n = ${msg.n}');
  }
}

class ISO {
  int n = 0;
}

//----------------------------------------
///暂停与重启
// void main() {
//   print('start');
//   Isolate.spawn(subMain, 'mm').then((value) {
//
//     int n = 0;
//     Capability? capability = null;
//     while (true) {
//       delay(1000);
//       print('go|$n');
//       switch(n++) {
//         case 2:
//           capability = value.pause();
//           break;
//         case 6:
//           value.resume(capability!);
//           break;
//       }
//       if (n > 15) break;
//     }
//   });
//   print('end');
// }

void subMain(msg) {
  print('msg = $msg|start');
  for (var i = 0; i < 5; ++i) {
    print('sub|go');
    Future(() {
      delay(1000);
      print('future|$msg|$i');
    });
  }
  print('msg = $msg|end');

  // while(true) {
  //   print('go');
  //   Future(()=>print('~~future~~|$msg'));
  //   delay(1000);
  // }
}

//----------------------------------------

///使用ReceivePort
// void main() {
//
//   //例一：基本使用
//   ReceivePort receivePort = ReceivePort();
//   receivePort.listen((message) {
//     print('receive|$message');
//     receivePort.close();
//   });
//
//   SendPort sendPort = receivePort.sendPort;
//   Isolate.spawn(one, sendPort);
//   print('---done---');
//
//
//   //例二：关闭线程
//   // ReceivePort receivePort = ReceivePort();
//   // receivePort.listen((message){
//   //   if(message == 'xx'){
//   //     receivePort.close();
//   //   }else{
//   //     print(message);
//   //   }
//   // });
//   // SendPort sendPort = receivePort.sendPort;
//   // Isolate.spawn(two, sendPort);
//   // print('---done---');
//
//
//   //例三：传递参数
//   // ReceivePort receivePort = ReceivePort();
//   // receivePort.listen((message) => print(message));
//   // Isolate.spawn(three, [1, receivePort.sendPort]);
//   // print('---done---');
//
//
//   //例四：数据处理
//   // ReceivePort receivePort = ReceivePort();
//   // receivePort.takeWhile((element) => element < 5)
//   //     .map((event) => event *2)
//   //     .listen((message) => print(message));
//   // Isolate.spawn(four, receivePort.sendPort);
//   // print('---done---');
//
//
//
//   // Isolate.spawn(one,
//   //   sendPort,
//   //   paused: false,
//   //   errorsAreFatal: true,
//   //   // onError: sendPort,
//   //   // onExit: sendPort,
//   // );
//
// }

void four(SendPort sendPort) {
  for (var i = 0; i < 100; ++i) {
    sendPort.send(i);
  }
}

void three(List args) {
  int n = args[0];

  SendPort sendPort = args[1];
  sleep(Duration(seconds: 2));

  sendPort.send(n++);
}

void two(SendPort sendPort) {
  sleep(Duration(seconds: 2));
  sendPort.send('one');
  sendPort.send('two');
  sendPort.send('xx');
}

void one(SendPort sendPort) {
  sleep(Duration(seconds: 2));
  sendPort.send('[send]xxxxx');
}

//----------------------------------------
///杀进程
// void main() {
//   //增加退出监听器
//   print('start');
//   Future<Isolate> future = Isolate.spawn(sk, 'mm', paused: true);
//   print('future = $future');
//   ReceivePort receivePort = ReceivePort();
//   receivePort.listen((message){
//     print('receive|message = $message');
//     if(message == 12) receivePort.close();
//   });
//
//   future.then((value){
//     print('then-start');
//     print('value = $value');
//     value.setErrorsFatal(true);
//     value.addOnExitListener(receivePort.sendPort, response: 12);
//     // value.addErrorListener(receivePort.sendPort);
//     value.resume(value.pauseCapability!);
//     print('value = $value|resumed');
//
//     delay(5000);
//     print('then-end');
//   });
//   print('end');
//
//
//
//   //增加错误监听器
//   // print('start');
//   // Future<Isolate> future = Isolate.spawn(sk, 'mm', paused: true);
//   // print('future = $future');
//   //
//   // ReceivePort receivePort = ReceivePort();
//   // receivePort.listen((message){
//   //   print('message.length = ${message.length}');
//   //   print('message[0] = ${message[0]}');
//   //   print('message[1] = ${message[1]}');
//   //   StackTrace stackTrace = StackTrace.fromString(message[1]);
//   //   print('stackTrace = $stackTrace');
//   //
//   // });
//   //
//   // future.then((value){
//   //   print('then-start');
//   //   print('value = $value');
//   //   value.setErrorsFatal(true);
//   //   value.addErrorListener(receivePort.sendPort);
//   //   value.resume(value.pauseCapability!);
//   //   print('value = $value|resumed');
//   //
//   //   delay(5000);
//   //   print('then-end');
//   // });
// }

void sk(msg) {
  delay(2000);
  print('${Isolate.current.debugName}|msg = $msg|start');
  for (var i = 0; i < 5; ++i) {
    print('sub|go|$i');
    Future(() {
      delay(1000);
      print('future|$msg|$i');
      // if(i == 2)throw Error();
    });
  }
  print('msg = $msg|end');
}

//----------------------------------------
// void main() {
//   print('start');
//
//   ReceivePort exitRP = ReceivePort();
//   exitRP.listen((_) {
//     print('~~onExit~~');
//     exitRP.close();
//   });
//
//   Isolate.spawn(five, null, onExit: exitRP.sendPort)
//       .then((value) {
//         sleep(Duration(seconds: 5));
//         print('kill');
//         value.kill(priority: Isolate.immediate);
//       });
//
//   print('end');
// }

void five(_) {
  Future(() {
    while (true) {
      sleep(Duration(seconds: 1));
      print('go!');
    }
  });
}

void six(_) {
  print('sub|start');
  for (var i = 0; i < 10; ++i) {
    Future(() {
      print('go!$i');
      sleep(Duration(seconds: 1));
    });
    print('add $i');
    // sleep(Duration(seconds: 1));
  }

  print('sub|end');
}

//----------------------------------------
void main() {
  ReceivePort receivePort = ReceivePort();
  receivePort.listen((message) {
    print('receive|$message');
    receivePort.close();
  });
  Isolate.spawn(tk, 'mm', debugName: 'kkk').then((value) {
    print('value.pauseCapability = ${value.pauseCapability}');
    print('value.terminateCapability = ${value.terminateCapability}');

    value = Isolate(receivePort.sendPort);

    print('value.pauseCapability = ${value.pauseCapability}');
    print('value.terminateCapability = ${value.terminateCapability}');
    // value.controlPort.send(11);
  });
}

void tk(msg) {
  print('tk|Isolate.current = ${Isolate.current.debugName}');
  for (var i = 0; i < 5; ++i) {
    Future(() {
      print('$i|tk|Isolate.current = ${Isolate.current.debugName}');
      print('$i|tk|Isolate.pauseCapability = ${Isolate.current.pauseCapability}');
    });
    sleep(Duration(seconds: 1));
    print('go');
  }
}
//----------------------------------------
// void main() {
//   print('start');
//   //方式一
//   // Uri uri = Uri.file('../res/test.txt');
//   // Future<Isolate> future = Isolate.spawnUri(uri, ['111','222'], 'ttt');
//   // future.then((value) => print('value = $value'));
//
//   //方式二
//   // Uri uri = Uri.parse('package:DartBasics/iso.dart');
//   // Isolate.spawnUri(uri, ['111','222'], 'ttt')
//   //     .then((value) => print('value = $value'));
//
//   //方式三
//   Uri uri = Uri.parse('package:DartBasics/iso.dart');
//
//   ReceivePort exitRP = ReceivePort();
//   exitRP.listen((_) {
//     print('~~onExit~~');
//     exitRP.close();
//   });
//
//   Isolate.spawnUri(uri, ['one', 'two'], 11, onExit: exitRP.sendPort, errorsAreFatal: false);
//
//   // delay(2000);
//   print('end');
// }

//----------------------------------------

// import '../res/test.txt';
//
// void main(){
//   print('dddd');
//   show();
// }

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
