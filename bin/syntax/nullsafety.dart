/**
 * Created by Administrator on 2021/10/25.
 */
//懒加载
// int k = 9;
// late int j;
// main(){
//   k = 1;
//   print("k is $k");
//
//   j = 3;
//   print('j is $j');
// }

//空安全
main() {
  //使用??运算符
  // var ns = 1;
  // var n = ns ?? ns++;
  // print('n = $n');
  //
  // ns ??= 4;
  // print('n = $n');

  //使用...?运算符
  // var list;
  // var ls = [6,7];
  // var list1 = [1, ...?list, ...ls!, 9];
  // print('list1 is $list1');


  //使用?[]运算符
  var ls = null;
  print('ls[3] is ${ls[3]}');


  //Map容器使用!检查空安全
  // var map = {'key': 'value'};
  // int r = map['jack']!;
  // print();


  //使用!强制类型转换
  // show('ok');
  // show(null);

}

show(String? rr){
  // print('rr is ${rr.length}');

  print('rr is ${rr?.length}');
  print('rr is ${rr!.length}');
}