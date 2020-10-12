import 'dart:math';

/**
 * Created by Administrator on 2020/10/6 7:38.
 */
void main() {
  Random random = Random();
  for (var i = 0; i < 50; ++i) {
    print(random.nextInt(100));
  }
}