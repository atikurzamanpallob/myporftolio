import 'package:intl/intl.dart';

class TimeFormatter {
  static String getFormattedDate(
    DateTime date, {
    String outputformat = "dd MMM yyyy ",
  }) {
    return DateFormat(outputformat).format(date);
  }
}
