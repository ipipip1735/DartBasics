/**
 * Created by Administrator on 2021/10/31.
 */
main(){

  AInherit a = AInherit(99);
  print('a._i is ${a._i}');
  a._show();

  BInherit b = BInherit(9);
  b.show();

}


class AInherit{
  int? _i;
  int? j;

  AInherit(this._i);
  _show(){
    print('~~A.show()~~');
  }
}

class BInherit extends AInherit{
  BInherit(int? i) : super(i);

  @override
  show() {
    super._show();
    print('~~B.show()~~');
  }
}


/**
 * 抽象类
 */
// main(){
//   D d = D();
//   d.show();
// }

abstract class C{
  show();
}

class D extends C{
  @override
  show() {
    print('~~D.show()~~');
  }

}