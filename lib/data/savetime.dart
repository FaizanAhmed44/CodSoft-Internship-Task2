import 'package:flutter/material.dart';

class TimeData {
  static TimeOfDay? starttime;
  static TimeOfDay? endtime;
  static DateTime? date;

  void setStartTime(TimeOfDay t) {
    starttime = t;
    print("object");
    print(starttime);
  }

  void setEndTime(TimeOfDay t) {
    endtime = t;
    print("object1");
    print(endtime);
  }

  void setDate(DateTime t) {
    date = t;
    print("object1");
    print(date);
  }
}
