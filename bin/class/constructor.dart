import 'dart:mirrors';

/**
 * Created by Administrator on 2020/9/29.
 */
// main() {
//   //构造函数默认参数
//   OneCst one = OneCst();
//   TwoCst two = TwoCst();
//   // TwoCst two = TwoCst(1);
// }

class OneCst {
  OneCst() {
    print('~~OneCst.OneCst()~~');
  }
  show(){

  }
}

class TwoCst extends OneCst {
  TwoCst() {
    print('~~TwoCst.TwoCst()~~');
  }
  // TwoCst(int k) {
  //   print('~~TwoCst.TwoCst()~~');
  // }
}

/**
 * 命名构造函数
 */
// main() {
//   OneNC nc = OneNC();
//   // OneNC one = OneNC.one(8);
//
//   TwoNC twoNC = TwoNC();
//   TwoNC twoNC1 = TwoNC.one(6);
// }

class OneNC {
  OneNC() {
    print('~~OneNC.OneNC()~~');
  }

  OneNC.one(int i) {
    print('~~OneNC.OneNC.one()~~');
  }
}

class TwoNC extends OneNC {
  TwoNC() {
    print('~~TwoNC.TwoNC()~~');
  }
  TwoNC.one(int i) {
    print('~~TwoNC.TwoNC.one()~~');
  }
}


/**
 * 初始化列表
 */
// main() {
//
//   OneInit one = OneInit();
//   print('one.x is ${one.x}');
//
//   //初始化列表中调用父类构造函数
//   // FourNC nc = FourNC.one(9);
// }

class ThreeNC {
  int? i;
  ThreeNC(){
    print('~~ThreeNC.ThreeNC()~~');
  }
  ThreeNC.one(int i){
    print('~~ThreeNC.ThreeNC.one()~~');
    this.i = i;
  }

}
class FourNC extends ThreeNC {
  FourNC.one(int i) : super.one(i);
}

class ZeroInit {

  ZeroInit(){
    print('~~ZeroInit.ZeroInit()~~');
  }
}
class OneInit extends ZeroInit {
  int x;
  OneInit(): x = 1{
    print('~~OneInit.OneInit()~~');
  }
}



/**
 * 使用getter和setter
 */
// void main(List<String> arguments) {
//   //
//   D d = D();
//   print('d.iii = ${d.iii}');
//
//   d.iii = 33;
//   print('d.iii = ${d.iii}');
//
// }
//
// class D {
//   //iii属性
//   int get iii {
//     print('~~get~~');
//     return 22;
//   }
//
//   set iii(n) {
//     print('~set~~');
//     iii = n;
//   }
// }


/**
 * 常构造函数
 */
// main() {
//   //命名构造函数作常构造函数
//   // A a = A(1, 'dd');
//   // print(a.a);
//
//   //使用Map
//   // B b = B(b: 'ok', d: 7.7, a: 99,);
//   // B b = B(99, b: 'ok', d: 7.7,);
//   // print('${b.a}, ${b.b}, ${b.c}, ${b.d}');
//
//
//   //常对象
//   // var i = 3;
//   // B b = B(i, b: 'ok', d: 7.7,);
//   // print('${b.a}, ${b.b}, ${b.c}, ${b.d}');
//   // i = 9;
//   // print('${b.a}, ${b.b}, ${b.c}, ${b.d}');
//
//   //创建常实例
//   B b = const B(3, b: 'ok', d: 7.7,);
//
//
//
//   // E ee = E(name: 'oms');
//   // print(ee.name);
//   // print(ee.name[1]);
//
//   // FF ff = FF(1,2);
// }

class A {
  final int a;
  final String b;

  const A(this.a, this.b);
  const A.one():a=1, b='OO';
}

class B {
  final int a;
  final String b;
  final String c;
  final double d;

  // const B({this.a = 1, this.b = 'bb', this.c = 'cc', this.d = 5.3});
  const B(this.a, {this.b = 'bb', this.c = 'cc', this.d = 5.3});
}


/**
 * 工厂构造函数
 */
void main(List<String> arguments) {

  // var c = C();
  var d = D.one();
}

class C {
   factory C(){
     print('~~factory|C.C()~~');
     return C.one();
  }
  C.one();
}
class D {
  D(){
    print('~~D.D()~~');
  }
   factory D.one() => D();
}