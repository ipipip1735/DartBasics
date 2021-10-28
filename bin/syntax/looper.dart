import '../collection.dart';

/**
 * Created by Administrator on 2021/10/27.
 */
main(){

  // forLoop();//for循环

  // whileLoop();//while循环

}

void whileLoop() {
  var n = 0;
  while(n++ < 3) {
    print('n is $n');
  }

}

void forLoop() {
  List list = [1,2,4];
  for (var e in list) {
    print('e is $e');
  }

  for (var i = 0; i < list.length; ++i) {
    print('list[$i] is ${list[i]}');
  }
}