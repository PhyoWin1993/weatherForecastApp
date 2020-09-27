import 'package:intl/intl.dart';

class Util {
  static String appId = "1c2df5f09fbd1685b7ed89cfbb1c17d9";
  static String getFormatDate(DateTime dateTime) {
    return new DateFormat("EEE, MMM d, ''yy").format(dateTime);
  }
}
