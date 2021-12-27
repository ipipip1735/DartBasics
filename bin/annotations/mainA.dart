/**
 * Created by Administrator on 2021/11/13.
 */
import 'package:meta/meta.dart';
import 'annotation.dart';

// main() {
//   OOS oos = OOS();
//   oos.opop();
// }

class OOS {
  @deprecated
  opop() {}
}


/**
 * 使用@required
 */
main() {
  showOne();
}

void showOne({@required a,  b}) {
  print('a = ${a}, b = ${b}');
}


/**
 * 使用自定义注解
 */

// main() {
//   showOne();
// }
//
// void showOne({a = 3, b = 'four'}) {
//   print('a = ${a}, b = ${b}');
// }

class PPL {
  @Ko('OO')
  void see() {
  }
}
