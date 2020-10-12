import 'package:DartBasics/pkg.dart';

void main(){
  print('--mian--');

  A a = A(null, 'dsd', 55);
  print('${a.a} - ${a.b}');

  // a._f; //访问私有变量，报错

  // a._show(); //访问私有方法，报错

  // _B b = _B(); //访问私有类，报错

  // C c = C(); //访问导出时的隐藏类，报错

}