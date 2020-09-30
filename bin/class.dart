/**
 * Created by Administrator on 2020/9/29.
 */
void main(List<String> arguments) {

  // var p = OneConst(1,2);
  // print(p.a);

  M mo = M();

  mo.see();
  mo.show();


}


mixin MOne on Aa{
  void see();
  void view();
}

class M extends Aa with MOne{

  void see() {
    print('Aa');
  }
  void show() {
    print('Aa');
  }
}


class OneConst {

  int a,b;

  OneConst(int a, int b){
    this.a = a;
    this.b = b;
    print("$a, $b");
  }
}


abstract class Word{
  void show();

  Word(String o){
    Word w = Aa();
  }
}

class Aa implements Word{
  void show() {
    print('Aa');
  }

  void view() {
    print('Aa');
  }
}

class Bb implements Word{
  void show() {
    print('Bb');
  }
}