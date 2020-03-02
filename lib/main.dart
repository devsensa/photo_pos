import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:photo_pos/pages.dart';
import "package:photo_pos/services.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final navigationService = NavigationService();
    return Provider.value(
      value: navigationService,
      child: MaterialApp(
        navigatorKey: navigationService.navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/home",
        routes: <String, WidgetBuilder>{
          "/": (context) => WelcomePage(),
          "/home": (context) => HomePage(),
          "/points-of-sale": (context) => PointsOfSalePage(),
          "/pos": (context) => PosPage(),
          "/settings": (context) => SettingsPage(),
          "/deals": (context) => DealPage(),
          "/staff": (context) => StaffPage(),
          "/staff/employee": (context) => EmployeePage(),
        },
      ),
    );
  }
}
