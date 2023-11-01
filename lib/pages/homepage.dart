import 'package:codsoft_task2/data/savetime.dart';
import 'package:codsoft_task2/pages/dialogbox.dart';
import 'package:codsoft_task2/utils/data.dart';
import 'package:codsoft_task2/utils/data1.dart';

import 'package:codsoft_task2/utils/dimennsions.dart';
import 'package:codsoft_task2/utils/todotile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  final controller1 = TextEditingController();
  TimeData dt = TimeData();
  DataBase db = DataBase();
  DataBase1 db1 = DataBase1();
  // DataBase db1 = DataBase();
  // DataBase db = DataBase();
  // var item = Get.find<SignUpController>().getItems;
  final _myBox = Hive.box('databox');
  final _myBox11 = Hive.box('databox11');
  var a;
  @override
  void initState() {
    // TODO: implement initState
    if (_myBox.get("data-list") == null &&
        _myBox11.get("data-list11") == null) {
      db.createInitialData();
      db1.createInitialData();
      // db1.createInitialData1();
    } else {
      db.loadData();
      db1.loadData();
      // db1.loadData1();
      print("Lenght of 1 is " + db1.dataList11.length.toString());
      print("Lenght of 2 is " + db.dataList.length.toString());
    }
    a = db1.getOngoingData;
    saveOngoing();
    super.initState();
  }

  Future<void> CheckBoxChanged(bool? val, int index) async {
    setState(() {
      db.dataList[index][2] = !db.dataList[index][2];
    });
    db.updateData();
    await Future.delayed(Duration(seconds: 1));
    if (db.dataList[index][2] == true) {
      deleteTask(index);
    }
  }

  void chehckData() {}

  void CreateTask(int ind) {
    // print("Lenght of 2 is " + db1.dataList11.length.toString());
    // db.dataList.removeAt(0);
    // db.updateData();
    Get.to(() => DialogBox(
          index: ind,
          onEdit: (Value) => editTask(Value!),
          controller: controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: SaveTask,
          controller1: controller1,
          istrue: false,
        ));
  }

  void SaveTask() {
    setState(() {
      db.dataList.add([
        controller.text,
        controller1.text,
        false,
      ]);

      print("aasas" + TimeData.starttime.toString());

      controller.clear();
      controller1.clear();

      db1.dataList11.add([
        TimeData.starttime.toString(),
        TimeData.endtime.toString(),
        TimeData.date.toString()
      ]);
    });
    Navigator.of(context).pop();
    saveOngoing();
    db.updateData();
    db1.updateData();
  }

  void editData(int ind) {
    List edit1 = [];
    List edit2 = [];
    setState(() {
      edit1.add([
        controller.text,
        controller1.text,
        false,
      ]);
      edit2.add([
        TimeData.starttime.toString(),
        TimeData.endtime.toString(),
        TimeData.date.toString()
      ]);

      db.dataList[ind] = edit1[0];
      db1.dataList11[ind] = edit2[0];

      controller.clear();
      controller1.clear();
    });
    Navigator.of(context).pop();

    db.updateData();
    db1.updateData();
  }

  void editTask(int ind) {
    Get.to(() => DialogBox(
          onEdit: (Value) => editData(Value!),
          controller: controller,
          index: ind,
          onCancel: () => Navigator.of(context).pop(),
          onSave: SaveTask,
          controller1: controller1,
          istrue: true,
        ));
  }

  void deleteTask(int ind) {
    setState(() {
      db.dataList.removeAt(ind);
      db1.dataList11.removeAt(ind);
      // db1.dataList11.removeAt(0);
      // db1.dataList11.removeAt(2);
    });
    db.updateData();
    db1.updateData();
  }

  List ongoingDataNameDesc = [];
  List ongoingDataDateTime = [];

  void saveOngoing() {
    setState(() {
      ongoingDataDateTime = [];
      ongoingDataNameDesc = [];

      if (db1.getOngoingData() > 0) {
        print("lenght is  ss s s s s " + db1.getOngoingData().toString());
        for (int i = 0; i < db1.getOngoingData(); i++) {}
        print("lenght is  ss s s s saSAs " +
            ongoingDataNameDesc.length.toString());
      }
    });
  }

  bool istrue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 251, 252, 251),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            CreateTask(0);
          },
          backgroundColor: Colors.orange,
          label: "Add New Task".text.bold.make(),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            // child: Expanded(
            // child: Container(
            //   width: double.maxFinite,
            //   height: 850,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // VxArc(
                //     height: 30,
                //     edge: VxEdge.bottom,
                //     arcType: VxArcType.convex,
                //     child: Container(
                //       width: double.maxFinite,
                //       height: 250,
                //       color: Vx.orange100,
                //       child: Stack(
                //         children: [
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Icon(
                //                 Icons.menu,
                //                 size: Dimension.font30,
                //                 color: Colors.black54,
                //               ),
                //               Row(
                //                 children: [
                //                   Icon(
                //                     CupertinoIcons.search,
                //                     size: Dimension.font30,
                //                     color: Colors.black54,
                //                   ),
                //                   SizedBox(
                //                     width: Dimension.width20,
                //                   ),
                //                   Icon(
                //                     Icons.notifications_outlined,
                //                     size: Dimension.font30,
                //                     color: Colors.black54,
                //                   )
                //                 ],
                //               )
                //             ],
                //           ).pSymmetric(
                //               h: Dimension.width15, v: Dimension.height10),
                //           "${db.dataList.length} Tasks are pending"
                //               .text
                //               .color(Colors.orange)
                //               .size(Dimension.font20)
                //               // .color(Colors.black54)
                //               .make()
                //               .pSymmetric(h: Dimension.width15)
                //               .marginOnly(top: Dimension.height50),
                //         ],
                //       ),
                //     )),

                SizedBox(
                  height: Dimension.height10 / 1.6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      size: Dimension.font30,
                      color: Colors.black54,
                      // color: Colors.orange,
                    ),
                    Row(
                      children: [
                        Icon(CupertinoIcons.search,
                            size: Dimension.font30, color: Colors.black54
                            // color: Colors.orange,
                            ),
                        SizedBox(
                          width: Dimension.width20,
                        ),
                        Icon(
                          Icons.notifications_outlined,
                          size: Dimension.font30,
                          color: Colors.black54,
                          // color: Colors.orange,
                        )
                      ],
                    )
                  ],
                ).pSymmetric(h: Dimension.width15),
                SizedBox(
                  height: Dimension.height15,
                ),
                "Task List "
                    .text
                    .size(Dimension.font30 * 1.2)
                    // .color(Colors.orange)
                    .bold
                    .make()
                    .pSymmetric(h: Dimension.width15),
                "${db.dataList.length} Tasks are pending"
                    .text
                    .size(Dimension.font17)
                    .color(Colors.black54)
                    .make()
                    .pSymmetric(h: Dimension.width15 * 1.2),
                SizedBox(
                  height: Dimension.height10,
                ),

                Divider(
                  thickness: 1,
                ).pSymmetric(h: Dimension.width15),
                SizedBox(
                  height: Dimension.height10,
                ),
                // Container(
                //   width: double.maxFinite,
                //   height: Dimension.height70 / 1.2,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(Dimension.radius30),
                //       color: const Color.fromARGB(255, 255, 255, 255),
                //       boxShadow: [
                //         BoxShadow(
                //           color: Colors.grey.withOpacity(0.6),
                //           blurRadius: 4,
                //           spreadRadius: 1,
                //         )
                //       ]),
                //   child: Row(
                //     children: [
                //       Icon(
                //         CupertinoIcons.search,
                //         size: Dimension.icon30,
                //         color: Colors.black54,
                //       ),
                //       SizedBox(
                //         width: Dimension.width10,
                //       ),
                //       "Search courses"
                //           .text
                //           .color(Colors.black54)
                //           .size(Dimension.font15)
                //           .make()
                //     ],
                //   ).pSymmetric(h: Dimension.width20),
                // ).pSymmetric(h: Dimension.width15),

                // SizedBox(
                //   height: Dimension.height15,
                // ),
                "Ongoing Task"
                    .text
                    .size(Dimension.font20 * 1.3)
                    .color(Colors.black)
                    .fontWeight(FontWeight.w500)
                    .make()
                    .pSymmetric(h: Dimension.width20),
                SizedBox(
                  height: Dimension.height15,
                ),
                db1.getOngoingData() == 0
                    ? Container(
                        height: Dimension.height80 * 2,
                        child: Image.asset(
                          "asset/images/emptycheck.png",
                          fit: BoxFit.cover,
                        ).centered(),
                      )
                    : Container(
                        // color: Vx.amber200,
                        width: double.maxFinite,
                        height: Dimension.height80 * 1.92,
                        // padding: EdgeInsets.all(9),
                        child: ListView.builder(
                          itemCount: db1.getOngoingData(),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  bottom: Dimension.height10 / 2,
                                  left: Dimension.width4 * 2,
                                  right: Dimension.width4 * 2,
                                  top: Dimension.height10 / 1.7),
                              width: double.maxFinite,
                              height: Dimension.height120 * 1.1,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimension.radius20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                  ),
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(1, 7),
                                  ),
                                ],
                                color: Color.fromARGB(255, 255, 177, 59),

                                // color:
                                //     const Color.fromARGB(255, 255, 255, 255)
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        db.dataList[db1.getOngoing()[index]][0],
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontWeight: FontWeight.bold,
                                            fontSize: Dimension.font25 / 1.1,
                                            decoration: db.dataList[
                                                    db1.getOngoing()[index]][2]
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none),
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                CheckBoxChanged(
                                                    db.dataList[
                                                        db1.getOngoing()[
                                                            index]][2],
                                                    db1.getOngoing()[index]);
                                              });
                                            },
                                            child: Container(
                                                width: Dimension.width25,
                                                height: Dimension.width25,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(
                                                        Dimension.radius10 / 2),
                                                    border: Border.all(
                                                        width: 2,
                                                        color:
                                                            const Color.fromARGB(
                                                                255,
                                                                255,
                                                                255,
                                                                255)),
                                                    color: db.dataList[db1.getOngoing()[index]]
                                                            [2]
                                                        ? const Color.fromARGB(
                                                            255, 255, 255, 255)
                                                        : Colors.transparent),
                                                child: db.dataList[db1
                                                        .getOngoing()[index]][2]
                                                    ? Icon(
                                                        Icons.done,
                                                        color: Colors.orange,
                                                        size: Dimension.icon20,
                                                      )
                                                    : Container()),
                                          ),
                                          SizedBox(
                                            width: Dimension.width10 / 1.32,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              editTask(db1.getOngoing()[index]);
                                            },
                                            child: Container(
                                                width: Dimension.width25,
                                                height: Dimension.height25,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.white,
                                                      width: 2,
                                                    ),
                                                    color: Vx.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimension.radius10 /
                                                                2)),
                                                child: Icon(
                                                  Icons.edit,
                                                  size: Dimension.icon20,
                                                  color: Colors.orange,
                                                )),
                                          ),
                                        ],
                                      )
                                    ],
                                  ).pOnly(right: Dimension.width10 / 1.5),
                                  db.dataList[db1.getOngoing()[index]][1]
                                      .toString()
                                      .text
                                      .ellipsis
                                      .size(Dimension.font15 * 1.1)
                                      .color(Color.fromARGB(255, 255, 255, 255))
                                      .make(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.watch_later,
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            size: Dimension.icon30 / 1.1,
                                          ),
                                          SizedBox(
                                            width: Dimension.width10 / 1.1,
                                          ),
                                          "${db1.dataList11[db1.getOngoing()[index]][0].substring(10, 15)} to  ${db1.dataList11[db1.getOngoing()[index]][1].substring(10, 15)}"
                                              .text
                                              .size(Dimension.font15)
                                              .color(const Color.fromARGB(
                                                  255, 255, 255, 255))
                                              .make(),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.date_range,
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            size: Dimension.icon30 / 1.1,
                                          ),
                                          SizedBox(
                                            width: Dimension.width10 / 1.1,
                                          ),
                                          "${db1.dataList11[db1.getOngoing()[index]][2].substring(0, 10)}"
                                              .text
                                              .size(Dimension.font15)
                                              .color(Color.fromARGB(
                                                  255, 255, 255, 255))
                                              .make(),
                                        ],
                                      ),
                                    ],
                                  ).pOnly(right: Dimension.width4)
                                ],
                              ).pOnly(
                                  left: Dimension.width15,
                                  right: Dimension.width10),
                            );
                          },
                        ),
                      ).pSymmetric(h: Dimension.width10),
                SizedBox(
                  height: Dimension.height20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Remaining Task"
                        .text
                        .size(Dimension.font20 * 1.2)
                        .color(Colors.black)
                        .fontWeight(FontWeight.w500)
                        .make()
                        .pSymmetric(h: Dimension.width20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          istrue = !istrue;
                        });
                      },
                      child: Row(
                        children: [
                          "See All"
                              .text
                              .color(Colors.orange)
                              .size(Dimension.font15)
                              .make()
                              .pOnly(right: Dimension.width10 / 2),
                          istrue
                              ? Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: Colors.orange,
                                  size: Dimension.icon30 / 1.2,
                                )
                              : Icon(
                                  Icons.arrow_drop_up_sharp,
                                  color: Colors.orange,
                                  size: Dimension.icon30 / 1.2,
                                )
                        ],
                      ),
                    ).pOnly(right: Dimension.width15)
                  ],
                ),

                SizedBox(
                  height: Dimension.height20,
                ),
                Container(
                  height: Dimension.height100 * 2.5,
                  // color: Vx.amber100,
                  margin: EdgeInsets.only(bottom: Dimension.height25 * 1.7),
                  child: db.dataList.isEmpty
                      ? Image.asset(
                          "asset/images/empty.png",
                          fit: BoxFit.cover,
                        ).centered()
                      : ListView.builder(
                          // physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              // db.dataList.length,
                              istrue && (db.dataList.length >= 2)
                                  ? 2
                                  : db.dataList.length,
                          itemBuilder: (context, index) {
                            return ToDoTile(
                              editFunction: () => editTask(index),
                              startTime: db1.dataList11[index][0],
                              endTime: db1.dataList11[index][1],
                              taskDescription: db.dataList[index][1],
                              taskName: db.dataList[index][0],
                              date: db1.dataList11[index][2],
                              taskCompleted: db.dataList[index][2],
                              deleteFunction: (context) => deleteTask(index),
                            );
                          }),
                ).pSymmetric(h: Dimension.width15),
                // SizedBox(
                //   height: Dimension.height20,
                // ),
              ],
            ),

            // ),
          ),
        ));
  }
}
