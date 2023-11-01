import 'package:hive/hive.dart';

class DataBase {
  List dataList = [];
  // List dataList1 = [];

  final _myBox = Hive.box('databox');
  // final _myBox1 = Hive.box('databox1');

  void createInitialData() {
    dataList = [
      ["Name", "happy and peacefully", false],
      ["Name", "happy and peacefully", false],
    ];
  }

  void loadData() {
    dataList = _myBox.get("data-list");
  }

  void updateData() {
    _myBox.put("data-list", dataList);
  }
}
