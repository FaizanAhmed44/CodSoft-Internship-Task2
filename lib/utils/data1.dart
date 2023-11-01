// import 'package:codsoft_task2/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DataBase1 {
  List dataList11 = [];
  String a = TimeOfDay.now().toString();
  String b = TimeOfDay.now().toString();
  String c = DateTime.now().toString();
  // List dataList1 = [];

  final _myBox11 = Hive.box('databox11');
  // final _myBox1 = Hive.box('databox1');

  void createInitialData() {
    dataList11 = [
      [a, b, c],
      [a, b, c],
    ];
  }

  void loadData() {
    dataList11 = _myBox11.get("data-list11");
  }

  void updateData() {
    _myBox11.put("data-list11", dataList11);
  }

  List<int> countIndexOfOngoingTask = [];

  void checkAnyOngoingTask() {
    DateTime date = DateTime.now();
    TimeOfDay time = TimeOfDay.now();

    for (int i = 0; i < dataList11.length; i++) {
      //   if(date.hour==dataList11[i])
      // }

      // var a = int.parse(dataList11[1][1].toString().substring(13, 15)); //minute
      // var a = int.parse(dataList11[0][0].toString().substring(10, 12)); //hour
      // var a = int.parse(time.toString().substring(10, 12));
      // print("a is " + a.toString());

      if (int.parse(date.toString().substring(8, 10)) ==
          int.parse(dataList11[i][2].toString().substring(8, 10))) {
        print("date present");
        if (((int.parse(time.toString().substring(10, 12)) >=
                    int.parse(dataList11[i][0].toString().substring(10, 12))) &&
                (int.parse(time.toString().substring(13, 15)) >=
                    int.parse(
                        dataList11[i][0].toString().substring(13, 15)))) &&
            ((int.parse(time.toString().substring(10, 12)) <=
                int.parse(dataList11[i][1].toString().substring(10, 12))))) {
          print("time exist at index " + i.toString());

          // (int.parse(time.toString().substring(13, 15)) >=
          //           int.parse(
          //               dataList11[i][1].toString().substring(13, 15)))
          if (((int.parse(time.toString().substring(10, 12)) ==
                  int.parse(dataList11[i][1].toString().substring(10, 12)))) &&
              (int.parse(time.toString().substring(13, 15)) >
                  int.parse(dataList11[i][1].toString().substring(13, 15)))) {
            countIndexOfOngoingTask.remove(i);
          } else {
            countIndexOfOngoingTask.add(i);
          }
        }
      } else {
        print("not present");
      }
    }
    print("lenght of data is " + dataList11.length.toString());
  }

  int getOngoingData() {
    countIndexOfOngoingTask = [];

    checkAnyOngoingTask();

    return countIndexOfOngoingTask.length;
  }

  List<int> getOngoing() {
    return countIndexOfOngoingTask;
  }

  // List OngoingData = [];

  // ongoingDataCheck(){

  // }
}
