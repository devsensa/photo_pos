import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/flutter_test.dart' as prefix0;
import 'package:photo_pos/app/bloc/export.dart';
import 'package:photo_pos/app/init.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

void main() {
  // todo add tests here
  testWidgets("Test initilizer", (WidgetTester tester) async {
    // todo test code here
    //await runInit();
  });

  test("Test instances exists", () async {
    // todo test code here
    await runInit();
    var c = kiwi.Container();
    expect(true, c.resolve<AuthState>("auth.state.init") != null);
    expect(true, c.resolve<DealsState>("deals.state.init") != null);
    expect(true, c.resolve<EmployeeState>("employee.state.init") != null);
    expect(true, c.resolve<MaterialsState>("materials.state.init") != null);
    expect(true, c.resolve<PointsOfSaleState>("points-of-sale.state.init") != null);
    expect(true, c.resolve<ProductsState>("products.state.init") != null);
    expect(true, c.resolve<ProfileState>("profile.state.init") != null);
    expect(true, c.resolve<ShiftsState>("shifts.state.init") != null);
    expect(true, c.resolve<AuthStore>("auth.store") != null);
    expect(true, c.resolve<DealsStore>("deals.store") != null);
    expect(true, c.resolve<EmployeeStore>("employee.store") != null);
    expect(true, c.resolve<MaterialsStore>("materials.store") != null);
    expect(true, c.resolve<AuthQuery>("auth.query") != null);
  });
}
