import 'package:logger/logger.dart';

class AppLogPrinter extends PrettyPrinter {
  final String _className;

  AppLogPrinter(this._className);
  @override
  List<String> log(LogEvent ev) {
    final msg = '$_className : $ev.message';
    final _ev = LogEvent(ev.level, msg, ev.error, ev.stackTrace);
    return super.log(ev);
  }
}

Logger getLogger(String className) {
  return Logger(printer: AppLogPrinter(className));
}
