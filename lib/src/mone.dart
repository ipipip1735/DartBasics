import 'dart:math';

class A{

  double a = pi;
  String b = 'bbbb';
  final int c;
  final String d;
  int _f = 0;
  int get f => _f;

  A(a, this.b, f,{this.c = 1988, this.d = ''}){
    this.a = a ?? this.a;
    this._f = f;
  }

  void _show(){
    print('_show');
  }
  void show(){
    print('show');
  }

}

class _B{
  int a = 4;
}

class C{
  int a = 4;
}