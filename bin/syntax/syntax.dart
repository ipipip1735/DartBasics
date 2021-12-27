/**
 * Created by Administrator on 2020/9/30.
 */
// void main() {
//   // const set = {if (list is List<int>) ...list}; // ...and a spread.
//
//   // finalConst();
// }



var foo = const[];
final bar = [1, 2];
const baz = [2, 3];


/**
 * 常变量和常量
 */
finalConst() {
  //const变量
  // foo.add(1);

  // print('foo is $foo');
  // foo = [1,2];
  // print('foo is $foo');
  // foo.add(1);
  // print('foo is $foo');


  //final变量
  // print('bar is $bar');
  // bar.add(1);
  // print('bar is $bar');


  // baz = [11];
  baz.add(1);
}



/**
 * 使用dynamic
 */
void main() {
  dynamic aa = 'd';
  print(aa is String);
  aa = 11;
  print(aa is int);


  //var是初始化时设置变量类型，但无法动态改变类型
  // var bb = 's';
  // bb = 99;

  //final声明的是常量，值和类型都不允许改变
  // final cc = 'iiiii';
  // cc = 'vv';

}


/**
 * 位运算符
 */
// void main() {
//   var k = ~0x0f;
//   print('k = $k');
// }