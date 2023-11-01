import 'package:codsoft_task2/controller/todolistcontroller.dart';
import 'package:codsoft_task2/repositry/todolistrepo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  //sharedpreferences
  Get.lazyPut(() => sharedPreferences);

  //todocontroller
  Get.lazyPut(() => SignUpController(signUpRepo: Get.find()));

  //todocontroller
  Get.lazyPut(() => SignUpRepo(sharedPreferences: Get.find()));
}
