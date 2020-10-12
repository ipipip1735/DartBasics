import 'dart:mirrors';

/**
 * Created by Administrator on 2020/9/29.
 */
void main(List<String> arguments) {
  //getter和setter
  // D d = D();
  // print(d.iii);

  //常构造函数
  // E ee = E(name: 'oms');
  // print(ee.name);
  // print(ee.name[1]);


  // A a = A(1, 'dd');
  // // A a = const A(1, 'dd');
  // print(a.a);


  FF ff = FF(1,2);



  //反射
  // C c = C(12, 42);
  // print(MirrorSystem.getName(reflect(c).type.simpleName));

  //构造函数默认参数
  // B b = B(1, b: 'ok');
  // print('${b.a}, ${b.b}');

  //常对象
  // int v = 223;
  // OneConst p = const OneConst(v,2);
  // print(p.a);

  // M mo = M();

  // mo.see();
  // mo.show();
  // mo.hear();

  //类型别名
  // ManyOperation d = (d,b) => 1;
}


class F {
  int a = 0;

  F(int a){
   print('--F.constructor--');
   print('a is $a');
   this.a = a;
  }

}

class FF extends F{
  int b;

  FF(int a, int b) : super(a){
    print('--FF.constructor--');
    print('a is $a');
    print('b is $b');
  }
}






typedef int ManyOperation(int firstNo, int secondNo);

class E {
  final String name;

  const E({this.name});
}

class D {
  int get iii {
    return 22;
  }
}

class C {
  int a, b;

  C(this.a, this.b) {
    print('-- Constructor --');
    // print('${this.a}');
  }
}

class B {
  final int a;
  final String b;

  const B(this.a, {this.b = 'sd'});
}

class A {
  int a;
  String b;

  A(a, b) {
    this.a = a;
    this.b = b;
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
