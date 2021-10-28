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
main(){
  //使用??运算符
  // var ns = 1;
  // var n = ns ?? ns++;
  // print('n = $n');
  //
  // ns ??= 4;
  // print('n = $n');


  //使用?...运算符
  var list;
  var list1 = [1, ...list, 9];
  print('list1 is $list1');
}