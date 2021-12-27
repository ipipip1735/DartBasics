/**
 * Created by Administrator on 2021/11/16.
 */
//混入混合
// main() {
//   AM am = AM(52);
//   am.show();
//   am.see();
// }

mixin OneM {
  int id = 8;
  String name = 'Jone';

  show() {
    print('~~OneM.show()~~|$this|id = ${this.id}, name = ${this.name}, ');
  }
}

mixin TwoM {
  int id = 8;
  String name = 'jack';

  show() {
    print('~~Two.show()~~|$this|id = ${this.id}, name = ${this.name}, ');
  }

  see() {
    print('~~Two.see()~~|$this');
  }
}

class AM with OneM {
  int id;

  AM(this.id);

  @override
  show() {
    print('~~AM.show()~~|$this|name = ${this.name}');
    super.show();
  }

  see() {
    print('~~AM.see()~~|$this|name = ${this.name}, id = ${this.id}, ');
  }
}

/**
 * 混入类
 */
// main() {
//   OneBM oneBM = OneBM('Bob');
//   oneBM.show();
// }

mixin ThreeM {
  int? id = 4;

  show() {
    print('~~ThreeM.show()|this.id = ${this.id}~~');
  }
}

class BM {
  int? id = 91;

  show() {
    print('~~BM.show()|this.id = ${this.id}~~~~');
  }
}

class OneBM with BM, ThreeM {
  String name;

  OneBM(this.name);
}

/**
 * 限定父类
 */
main(){

}

mixin FourM on CM {}
class CM {}
class OneCM extends CM{}
class TwoCM extends OneCM with FourM {}
// class ThreeCM extends TwoCM with FourM {}
