import 'dart:math';

class BLib{

  double a = pi;
  String b = 'bbbb';
  final int c;
  final String d;
  int _f = 0;
  int get f => _f;

  BLib(a, this.b, f,{this.c = 1988, this.d = ''}){
    this.a = a ?? this.a;
    this._f = f;
  }

  void _show(){
    print('_show');
  }
  void show(){
    print('show');
  }

  // void showA(){
  //   ALib aLib = ALib();
  //   aLib.show();
  //   aLib._show();
  // }

}

class _B{
  int a = 4;
}

class C{
  int a = 4;
}