import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_correios/flutter_correios.dart';

void main() {
  test('adds one to input values', () {
    final FlutterCorreios fc = FlutterCorreios();
    fc.fazerRastreio(codRastreio: "pt118988786br").then((rast) {
      print(rast.toString());
    });
//    final calculator = Calculator();
//    expect(calculator.addOne(2), 3);
//    expect(calculator.addOne(-7), -6);
//    expect(calculator.addOne(0), 1);
//    expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });
}
