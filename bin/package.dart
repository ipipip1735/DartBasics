///测试dart包导入导出


// import 'package:DartBasics/pkg.dart'; //使用scheme前缀导入包
import '/E:/Program/Flutter/DartBasics/lib/pkg.dart'; //使用绝对路径导入包


/**
 * Created by Administrator on 2020/9/29.
 */
void main(){
  print('--mian--');

  //测试dart包导入导出
  A a = A(null, 'dsd', 55);
  print('${a.a} - ${a.b}');

  // a._f; //访问私有变量，报错

  // a._show(); //访问私有方法，报错

  // _B b = _B(); //访问私有类，报错

  // C c = C(); //访问导出时的隐藏类，报错

}