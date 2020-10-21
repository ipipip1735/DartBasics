import 'dart:io';
import 'dart:isolate';

/**
 * Created by Administrator on 2020/10/21.
 */
///Isolate是dart的子线程，但不能共享内存
// void main() {
//   //方式一
//   int n = 0;
//
//   Isolate.spawn(kt, n);//n传递的是副本，不是引用
//
//   for (var i = 0; i < 10; ++i) {
//     sleep(Duration(seconds: 2));
//     print('main | $i | n = ${n++}');
//   }
//
//
//   //方式二
//   // int n = 0;
//   // final ISO iso = ISO();
//   // Isolate.spawn(sk, iso);//iso传递的是对象的副本，不是引用，isolate内存是独立的
//   //
//   // while(n++ < 20){
//   //   sleep(Duration(seconds: 1));
//   //   print('main | n = ${iso.n++}');
//   // }
// }
// void kt(int xx){
//   for (var i = 0; i < 10; ++i) {
//     sleep(Duration(seconds: 1));
//     print('Isolate | $i | n = $xx');
//   }
// }

// void sk(ISO msg) {
//   int n = 0;
//   while(n++ < 10) {
//     sleep(Duration(seconds: 1));
//     print('Isolate | n = ${msg.n}');
//   }
// }
//
//
// class ISO {
//   int n = 0;
// }



//----------------------------------------

///使用ReceivePort
// void main() {
//
//   //例一：基本使用
//   // ReceivePort receivePort = ReceivePort();
//   // receivePort.listen((message) => print(message));
//   // SendPort sendPort = receivePort.sendPort;
//   // Isolate.spawn(one, sendPort);
//   // print('---done---');
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
//
//   //例三：传递参数
//   // ReceivePort receivePort = ReceivePort();
//   // receivePort.listen((message) => print(message));
//   // Isolate.spawn(three, [1, receivePort.sendPort]);
//   // print('---done---');
//
//
//   //例四：数据处理
//   ReceivePort receivePort = ReceivePort();
//   receivePort.takeWhile((element) => element < 5)
//       .map((event) => event *2)
//       .listen((message) => print(message));
//   Isolate.spawn(four, receivePort.sendPort);
//   print('---done---');
//
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
//
// void four(SendPort sendPort){
//   for (var i = 0; i < 100; ++i) {
//     sendPort.send(i);
//   }
// }
//
//
// void three(List args){
//   int n = args[0];
//
//   SendPort sendPort = args[1];
//   sleep(Duration(seconds: 2));
//
//   sendPort.send(n++);
// }
//
//
// void two(SendPort sendPort){
//   sleep(Duration(seconds: 2));
//   sendPort.send('one');
//   sendPort.send('two');
//   sendPort.send('xx');
// }
//
//
// void one(SendPort sendPort){
//   sleep(Duration(seconds: 2));
//   sendPort.send('xxxxx');
// }





//----------------------------------------
void main(){
  Uri uri = Uri.file('../res/test.txt');
  Isolate.spawnUri(uri, ['111','222'], 'ttt');
}




//----------------------------------------

// import '../res/test.txt';
//
// void main(){
//   print('dddd');
//   show();
// }