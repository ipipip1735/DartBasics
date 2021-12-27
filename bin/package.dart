///测试dart包导入导出
/**
 * Created by Administrator on 2020/9/29.
 */
//导出API
// import 'package:DartBasics/pkg.dart'; //使用scheme前缀导入包
// void main(){
//   ALib aLib = ALib();
//   aLib.show();
// }


/**
 * 导出私有API
 */
// import '../lib/src/mone.dart'; //严禁这样导入，这里是为了测试
// void main(){
//   ALib aLib = ALib();
//   aLib.show();
// }


/**
 * 使用绝对路径导入包
 */
// import '/E:/Program/Flutter/DartBasics/lib/pkg.dart';
// void main(){
//   ALib aLib = ALib();
//   aLib.show();
// }


/**
 * 导入本包库
 */
// import '../lib/pkg.dart';
// void main(){
//
//   OOOO o = OOOO();
//   o.i = 9;
//   print('o._j = ${o._j}');
//
//   o._showA();
// }




/**
 * 子类可见性
 */
// import 'class/inherit.dart';
// void main(){
//
//   AInherit a = AInherit(99);
//   print('a._i is ${a._i}');//私有成员无法访问
//   a._show(); //私有方法无法访问
//
//
//   //测试dart包导入导出
//   // A a = A(null, 'dsd', 55);
//   // print('${a.a} - ${a.b}');
//   // a._f; //访问私有变量，报错
//   // a._show(); //访问私有方法，报错
//   // _B b = _B(); //访问私有类，报错
//   // C c = C(); //访问导出时的隐藏类，报错
// }
//
//
// class BInherit extends AInherit{
//   BInherit(int? i) : super(i);
//
//   @override
//   show() {
//     print('~~B.show()~~');
//     print('_i is ${_i}'); //父类私有成员无法访问
//     print('j is ${j}');
//
//     super._show(); //父类私有方法无法访问
//   }
// }




/**
 * 部分导入，使用白名单
 */
// import 'package:DartBasics/pkg.dart' show C;
// void main(){
//   print('--mian--');
//   C c = C(); //访问导出时的隐藏类，报错
// }

/**
 * 部分导入，使用黑名单
 */
import 'package:DartBasics/pkg.dart' hide C;
void main(){
  //测试dart包导入导出
  BLib b = BLib(null, 'dsd', 55);
  print('${b.a} - ${b.b}');

  // b._f; //访问私有变量，报错
  // b._show(); //访问私有方法，报错
  // _B b = _B(); //访问私有类，报错
}