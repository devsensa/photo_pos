import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class AppContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(child: Text("")),
    );
//    return CupertinoTabScaffold(
//      tabBar: CupertinoTabBar(
//        border: null,
//        backgroundColor: Color.fromARGB(0, 0, 0, 0),
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled)),
//          BottomNavigationBarItem(icon: Icon(CupertinoIcons.folder)),
//          BottomNavigationBarItem(icon: Icon(CupertinoIcons.collections)),
//          BottomNavigationBarItem(icon: Icon(CupertinoIcons.info)),
//          BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings))
//        ],
//      ),
//      tabBuilder: (BuildContext context, int index) {
//        switch (index) {
//          case 0:
//            return CupertinoTabView(
//              onGenerateRoute: profile.generateRoute,
//            );
//            break;
//          case 1:
//            return CupertinoTabView(
//              onGenerateRoute: management.generateRoute,
//            );
//            break;
//          case 2:
//            return CupertinoTabView(
//              onGenerateRoute: shift.generateRoute,
//            );
//            break;
//          case 3:
//            return CupertinoTabView(
//              onGenerateRoute: analytics.generateRoute,
//            );
//            break;
//          case 4:
//            return CupertinoTabView(
//              onGenerateRoute: settings.generateRoute,
//            );
//            break;
//        }
//        return null;
//      },
//    );
  }
}
