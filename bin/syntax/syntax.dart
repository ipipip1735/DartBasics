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
 * 位运算符
 */
void main() {
  var k = ~0x0f;
  print('k = $k');
}
