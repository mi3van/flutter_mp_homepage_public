import 'package:my_precious_homepage/presentation/config.dart';

abstract class HelperDate {
  static DateTime nowSecure() {
    final deviceDate = DateTime.now();
    if (deviceDate.year >= minYearValue) {
      return deviceDate;
    } else {
      return DateTime(
        minYearValue,
        deviceDate.month,
        deviceDate.day,
        deviceDate.hour,
        deviceDate.minute,
        deviceDate.second,
        deviceDate.millisecond,
      );
    }
  }
}
