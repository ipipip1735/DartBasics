/**
 * Created by Administrator on 2021/11/14.
 */
main(){
  var one = EOne('mack', 12);
  // one.show();
  // one.view();
  // one.look();
  // print(one.id);

  print(EOneExt.MOM);
  EOneExt.hello();
  one.say();
  print(EOne);

  // EOne.hello();
  // print(MOM);
  // hello();



  // var two = EOne('Mary', 22);
  // String r = one + two;
  // print('r = $r');
}

class EOne {
  String name;
  int age;
  EOne(this.name, this.age);

  look(){
    print('~~EOne.look()~~');
  }
}

extension EOneExt on EOne {

  static int MOM = 99;

  static hello(){
    print('~~$MOM|EOneExt.hello()~~');
  }

  say(){
    hello();
  }

  String get id{
    return '$age''111';
  }

  show(){
    print('[${this.id}]one.name = ${this.name}, one.age = ${this.age}');
  }

  String operator +(EOne two) => '${two.id} - ${this.id}';
}

extension on EOne {

  see(){
    print('[${this.id}]one.name = ${this.name}, one.age = ${this.age}');
  }
}

extension on EOne {

  view(){
    print('~~EOne.show|$this~~');
  }
}

extension _ on EOne {

  look(){
    print('~~EOne.look|$this~~');
  }
}


class ETwo{
  external bool isBefore(DateTime other);
}