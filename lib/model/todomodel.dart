import 'package:flutter/material.dart';

class ToDoModel {
  String? name;
  String? desc;
  DateTime? date;
  TimeOfDay? starttime;
  TimeOfDay? endtime;

  ToDoModel({this.starttime, this.name, this.desc, this.date, this.endtime});

  // SignUpModel.fromJson()

  ToDoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    starttime = json['starttime'];
    endtime = json['endtime'];
    desc = json['desc'];
    date = json['date'];
  }
  Map<String, dynamic> toJson() {
    return {
      "starttime": this.starttime,
      "endtime": this.endtime,
      "name": this.name,
      "desc": this.desc,
      "date": this.date,
    };
  }
}
