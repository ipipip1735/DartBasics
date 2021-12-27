/**
 * Created by Administrator on 2021/11/28.
 */

main(){
  print('start');
  try {
    throw Exception('XXX');
  }catch (e) {
    print('e is $e');
  }
  print('end');

}