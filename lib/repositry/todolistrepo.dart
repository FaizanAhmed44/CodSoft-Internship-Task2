import 'dart:convert';

// import 'package:myapp6/Models/SignupModel.dart';
import 'package:codsoft_task2/model/todomodel.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SignUpRepo {
  final SharedPreferences sharedPreferences;
  SignUpRepo({required this.sharedPreferences});

  List<String> detail = [];

  void addToCartList(List<ToDoModel> item) {
    List<String> nama = [];

    if (sharedPreferences.containsKey("to-do-list")) {
      nama = sharedPreferences.getStringList("to-do-list")!;
    }

    detail = [];

    item.forEach((element) {
      return detail.add(jsonEncode(element));
    });

    nama.forEach((element) {
      return detail.add(element);
    });

    sharedPreferences.setStringList("to-do-list", detail);

    print(sharedPreferences.getStringList("to-do-list")?.length.toString());

    // getDetailList();
  }

// List<ToDoModel>
  List<ToDoModel> getDetailList() {
    List<String> detaildummy = [];

    if (sharedPreferences.containsKey("to-do-list")) {
      detaildummy = sharedPreferences.getStringList("to-do-list")!;

      print("inside cart Sign up list lenght is " +
          detaildummy.length.toString());
      print(detaildummy);
    }

    List<ToDoModel> detaillist = [];
    // detaildummy.forEach((element) {
    //   return detaillist.add(ToDoModel.fromJson(jsonDecode(element)));
    // });

    print("history dummy lenght is " + detaillist.length.toString());

    return detaillist;
  }
}
