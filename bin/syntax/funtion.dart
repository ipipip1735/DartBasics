/**
 * Created by Administrator on 2021/10/27.
 */
main() {
  // option();//可选参数

  // named(); //命名参数

  // returnValue();//返回值类型是可选的，编译器根据return语句自动判断

  // funtion();//匿名函数

  // closure();//闭包作用域


  // funtionObject();//函数类型

  // var s = view();//使用箭头表达式
  // print('s is $s');

  // read(1, 33, 333);


  var k = fnOne('one', 'two');//函数参数和返回值类型可以省略
  print('${k.runtimeType}|k = $k');

}


fnOne(one, two){
  print('one = $one, two = $two');
  return 'dd';
}

String view() => 'ddd';


read(_, t, __) => print('t = $t');

void funtionObject() {

  //限定参数类型和返回值
  String Function(int k) s;//限定返回值类型为String，参数类型为int
  s = (m){ return "oo";};
  print(s(11));

  // Function f = ()=> print('ok');
  // Function() g;
  // g = f;

  // Function(int i) g = (j)=> print('j = $j');
  // g(5);
  // Function(int) h = (j)=> print('j = $j');
  // h(8);
  // Function(int i) f = (String j)=> print('j = $j');


  // String Function(int i) t = (i) => 'go';
  //
  // String Function(int i) f = (i){
  //   i++;
  //   return 'i is $i';
  // };
}

returnValue() {
  return 22;
}

/**
 * 使用可选参数
 */
option() {
  // say();
  // say('GO');

  see(1, 2, 7, 4);
  see(1, 2, 7);
  see(1, 2);
  // see(1);
}

say([String? device]) {
  print('device is $device');
}

see(int a, int b, [int? c = 3, int? d]) {
  print('a=$a, b=$b, c=$c, d=$d');
}

/**
 * 使用命名参数
 */
named() {
  // look(n: 99);
  // look(n: 99, m: 'xx');

  // listen(int: 5, string: 'cc', String: 'hh');
  // hear('go', b: 6);

  show(11, b: 22);
}

listen({int: '4', string: 'ooo', String: 'xx'}) {
  print('int = $int, string = $string, String = $String');
}

hear(String s, {int a: 4, int b: 5}) {
  print('$s|a=$a, b=$b');
}

look({n: 4, m}) {
  print('n = $n, m = $m');
}

show(int a, {required int b, String c = 'c', double? d}) {
  print('a=$a, b=$b, c=$c, d=$d');
}


/**
 * 匿名函数
 */
void funtion() {

  //方式一：使用函数类型变量
  String Function(int k) s;
  s = (m){ return "oo";};
  print(s(11));


  //方式二：匿名函数直接赋值
  // String Function(int k) s = (m){
  //   print(m);
  //   return '${m++}';
  // };

  //方式三：使用箭头表达式
  // String Function(int k) s = (m)=> '${m++}';


}


/**
 * 闭包作用域
 */
Function? tt;
Function makeAdder(int addBy) {
  tt = (int i)=> addBy = i;
  return (int i) => addBy + i;
}

closure(){
  var add2 = makeAdder(2);
  var add4 = makeAdder(4);
  print('add2(3) is ${add2(3)}');
  print('add4(3) is ${add4(3)}');

  tt!(80);
  print('add2(3) is ${add2(3)}');
  print('add4(3) is ${add4(3)}');
}