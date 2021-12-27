/**
 * Created by Administrator on 2021/10/31.
 */

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

/**
 * 继承
 */
main() {
  // G g = new G();
  // g.show('dd');

  GG gg = GG();
  print('gg.show() = ${gg.show()}');
}

class G {
  show() {
    print('~~GG.show()~~');
    return 'one';
  }

// void show(String k) {
//   print('~~One.show()~~');
// }
}

class GG extends G {

  show(){
    return 55;
  }

  // String show(String k) {
  //   print('~~One.show()~~');
  //   return 'd';
  // }
  // String show(String k) {
  //   print('~~GG.show()~~');
  //   return 'd';
  // }
}

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
