import 'dart:math';

/**
 * Created by Administrator on 2020/9/28.
 */
void main(List<String> arguments) {



  //插值表达式
  // String s = "dsds";
  // print('$s Hello world!');



  //Set容器
  set();
  // setConst();


  //Map容器
  // map();



  // var p = const A(1,2);



  // iterable();
  
}

void iterable() {

  // for(String s in {'a','b','c'}) {
  //   print(s);
  // }


  // int element = {1,2,3,45,91}.firstWhere((element) => element > 5);
  // int element = {1,2,3,45,5}.singleWhere((element) => element > 5);
  // print(element);


  // print([1,2,3,45,1].takeWhile((element) => element < 5));
  // print([1,2,3,45,1].skipWhile((element) => element < 5));



}

void map() {

  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };
  print(gifts[0]);
  print(gifts);
  print(gifts['first']);



  // var nobleGases = {
  //   2: 'helium',
  //   10: 'neon',
  //   18: 'argon',
  // };


  //常量Map
  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

}


void set() {
  // var elements = <String>{};
  // elements.add('fluorine');
  // elements.addAll(halogens);


  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll({'aa', 'bb'});
  print(elements);
  print(elements.elementAt(0));

}

void setConst() {

  //常量List
  final constantSet = const {
    'fluorine',
    'chlorine',
    'bromine',
    'iodine',
    'astatine',
  };
  // constantSet.add('helium');//错误，常量集不允许修改
  print(constantSet);
  print(constantSet.take(2));//获取部分

}