import 'package:codsoft_task2/model/todomodel.dart';
import 'package:codsoft_task2/repositry/todolistrepo.dart';
import 'package:get/get.dart';
// import 'package:myapp6/Models/SignupModel.dart';
// import 'package:myapp6/Repositry/CartRepo.dart';
// import 'package:myapp6/Repositry/Signuprepo.dart';

class SignUpController extends GetxController implements GetxService {
  final SignUpRepo signUpRepo;

  SignUpController({
    required this.signUpRepo,
  });

  Map<DateTime, ToDoModel> _accountsDetail = {};
  Map<DateTime, ToDoModel> get accountsDetail => _accountsDetail;

  void addData(ToDoModel signUp) {
    _accountsDetail.putIfAbsent(signUp.date!, () {
      return ToDoModel(
          starttime: signUp.starttime,
          endtime: signUp.endtime,
          name: signUp.name,
          desc: signUp.desc,
          date: signUp.date);
    });

    print("Lenght of list is " + _accountsDetail.length.toString());

    // signUpRepo.addToCartList(getItems);

    update();
  }

  List<ToDoModel> get getItems {
    return _accountsDetail.entries.map((e) {
      return e
          .value; //value mtlb cartmodel or key m id agr id chahiye hoti to key return krte
    }).toList();
  }

  // List<ToDoModel> getDetailList() {
  //   return signUpRepo.getDetailList();
  // }

  // int getDataPageId() {
  //   print("aa  is" + dataa.toString());

  //   return dataa;
  // }

  // bool isLoged = false;

  // void isLogin() {
  //   isLoged = true;
  //   update();
  // }

  // void isLogout() {
  //   isLoged = false;
  //   update();
  // }

  // bool checkLogin() {
  //   return isLoged;
  // }
}
