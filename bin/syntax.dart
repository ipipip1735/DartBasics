/**
 * Created by Administrator on 2020/9/30.
 */

void main(){
  funtion();//匿名函数
}




void funtion() {

  //方式一：使用函数类型变量
  // String Function(int k) s;
  // s = (m){ return "oo";};
  // print(s(11));


  //方式二：匿名函数直接赋值
  // String Function(int k) s = (m){
  //   print(m);
  //   return '${m++}';
  // };

  //方式三：使用箭头表达式
  String Function(int k) s = (m)=> '${m++}';


}