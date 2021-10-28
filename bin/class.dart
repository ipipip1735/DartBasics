import 'dart:mirrors';

/**
 * Created by Administrator on 2020/9/29.
 */
// void main(List<String> arguments) {
//   //getter和setter
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
 * 构造函数默认参数
 */
main() {
  B b = B(1, b: 'ok');
  print('${b.a}, ${b.b}');
}


class B {
  final int a;
  final String b;

  const B(this.a, {this.b = 'sd'});
}



/**
 * 常构造函数
 */
// main() {
//   // E ee = E(name: 'oms');
//   // print(ee.name);
//   // print(ee.name[1]);
//
//
//   // A a = A(1, 'dd');
//   // // A a = const A(1, 'dd');
//   // print(a.a);
//
//
//   // FF ff = FF(1,2);
// }

// class E {
//   final String name;
//
//   const E({this.name});
// }


// class A {
//   int a = 0;
//   String b = "";
//
//   A(a, b) {
//     this.a = a;
//     this.b = b;
//   }
// }



/**
 * 反射
 */
// main() {
//   // C c = C(12, 42);
//   // print(MirrorSystem.getName(reflect(c).type.simpleName));
// }


/**
 * 常对象
 */
// main() {
//   // int v = 223;
//   // OneConst p = const OneConst(v,2);
//   // print(p.a);
//
//   // M mo = M();
//
//   // mo.see();
//   // mo.show();
//   // mo.hear();
// }

/**
 * 类型别名
 */
// main() {
//   // ManyOperation d = (d,b) => 1;
// }

class F {
  int a = 0;

  F(int a) {
    print('--F.constructor--');
    print('a is $a');
    this.a = a;
  }
}

class FF extends F {
  int b = 0;

  FF(int a, int b) : super(a) {
    print('--FF.constructor--');
    print('a is $a');
    print('b is $b');
  }
}

typedef int ManyOperation(int firstNo, int secondNo);



class C {
  int a, b;

  C(this.a, this.b) {
    print('-- Constructor --');
    // print('${this.a}');
  }
}



class MTwo {
  void hear() {
    print('MTwo hear');
  }
}

mixin MOne on Aa {
  void see() {
    print('MOne see()');
  }

  void view();
}

class M extends Aa with MOne, MTwo {
  void see() {
    print('M see');
  }

  void show() {
    print('M show');
  }
}

class OneConst {
  final int a, b;

  const OneConst(this.a, this.b);
}

abstract class Word {
  void show();

  Word(String o) {
    Word w = Aa();
  }
}

class Aa implements Word {
  void show() {
    print('Aa');
  }

  void view() {
    print('Aa');
  }
}

class Bb implements Word {
  void show() {
    print('Bb');
  }
}
