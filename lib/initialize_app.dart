import 'package:flutter/widgets.dart';

class InitializeApp extends StatefulWidget {
  final Widget child;

  InitializeApp(this.child);

  @override
  _InitializeAppState createState() => _InitializeAppState();
}

class _InitializeAppState extends State<InitializeApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
