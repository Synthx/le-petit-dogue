import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String format(String pattern) {
    return DateFormat(pattern).format(this);
  }
}
