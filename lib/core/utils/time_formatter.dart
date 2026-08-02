import 'package:intl/intl.dart';

class TimeFormatter {
  static String getFormattedDate(
    DateTime date, {
    String outputformat = "dd MMM yyyy ",
  }) {
    return DateFormat(outputformat).format(date);
  }

  static String getTimestamp() {
    return DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
  }

  static int difference(String? timestamp) {
    if (timestamp == null) {
      return 20;
    } else {
      DateTime currentTime = DateTime.now();
      DateTime previous = DateTime.parse(timestamp);
      return currentTime.difference(previous).inMinutes;
    }
  }
}
