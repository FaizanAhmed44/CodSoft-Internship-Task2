import 'package:codsoft_task2/controller/todolistcontroller.dart';
import 'package:codsoft_task2/data/savetime.dart';

import 'package:codsoft_task2/utils/dimennsions.dart';
import 'package:codsoft_task2/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class DialogBox extends StatefulWidget {
  final controller;
  int index;
  final controller1;
  VoidCallback onSave;
  Function(int?)? onEdit;
  VoidCallback onCancel;

  bool istrue;
  DialogBox({
    super.key,
    required this.index,
    required this.onEdit,
    required this.controller,
    required this.onCancel,
    required this.onSave,
    required this.controller1,
    required this.istrue,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  DateTime date = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  TimeData dt = TimeData();

  void ShowDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        date = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 248, 252, 250),
      backgroundColor: Vx.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Dimension.height15,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: widget.onCancel,
                  child: Icon(
                    Icons.arrow_back,
                    size: Dimension.icon30 / 1.1,
                  ),
                ),
                SizedBox(
                  width: Dimension.width70,
                ),
                "Create New Task".text.bold.size(Dimension.font20).make(),
              ],
            ),
            SizedBox(
              height: Dimension.height15 / 2,
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: Dimension.height15,
            ),
            "Task Name".text.bold.size(Dimension.font25).make(),
            SizedBox(
              height: Dimension.height20 / 1.1,
            ),
            TextField(
              // obscureText: isTrue ? true : false,
              controller: widget.controller,
              decoration: InputDecoration(
                  hintText: "e.g   Gaming",
                  // prefixIcon: Icon(
                  //   Icons.date_range_outlined,
                  //   // color: Colors.black,
                  //   color: Color.fromARGB(255, 78, 158, 255),
                  // ),

                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimension.radius15),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 0, 0, 0))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimension.radius15),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 0, 0, 0))),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimension.radius15),
                  )),
            ),
            SizedBox(
              height: Dimension.height20 / 1.1,
            ),
            "Date & Time".text.bold.size(Dimension.font25).make(),
            SizedBox(
              height: Dimension.height20 / 1.1,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: date.toString().substring(0, 10),
                  prefixIcon: GestureDetector(
                    onTap: () {
                      ShowDatePicker();
                    },
                    child: Icon(
                      Icons.date_range_outlined,
                      // color: Colors.black,
                      color: Colors.orange,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimension.radius15),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(213, 0, 0, 0))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimension.radius15),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(213, 0, 0, 0))),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimension.radius15),
                  )),
            ),
            SizedBox(
              height: Dimension.height20 / 1.1,
            ),
            "Description".text.bold.size(Dimension.font25).make(),
            SizedBox(
              height: Dimension.height20 / 1.1,
            ),
            TextField(
              // obscureText: isTrue ? true : false,
              controller: widget.controller1,

              decoration: InputDecoration(
                  hintText: "e.g   play with friends",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimension.radius15),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(213, 0, 0, 0))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimension.radius15),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(213, 0, 0, 0))),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimension.radius15),
                  )),
            ),
            SizedBox(
              height: Dimension.height25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Start Time"
                        .text
                        .bold
                        .size(Dimension.font20)
                        .make()
                        .pOnly(left: Dimension.width10 / 2),
                    SizedBox(
                      height: Dimension.height15,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final TimeOfDay? selectTime = await showTimePicker(
                          context: context,
                          initialTime: startTime,
                          initialEntryMode: TimePickerEntryMode.dial,
                        );
                        if (selectTime != null) {
                          setState(() {
                            startTime = selectTime;
                            print(selectTime);
                          });
                        }

                        print("Are in start time " +
                            startTime.toString().substring(10, 15));
                      },
                      child: Container(
                        width: Dimension.width130,
                        height: Dimension.height20 * 3,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimension.radius15 / 2),
                            border: Border.all(
                              color: Colors.black54,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "${startTime.toString().substring(10, 15)}"
                                .text
                                .size(Dimension.font15)
                                .color(Colors.black54)
                                .make(),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ).paddingAll(Dimension.height10),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "End Time"
                        .text
                        .bold
                        .size(Dimension.font20)
                        .make()
                        .pOnly(left: Dimension.width10 / 2),
                    SizedBox(
                      height: Dimension.height15,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final TimeOfDay? selectTime = await showTimePicker(
                          context: context,
                          initialTime: endTime,
                          initialEntryMode: TimePickerEntryMode.dial,
                        );
                        if (selectTime != null) {
                          setState(() {
                            endTime = selectTime;
                          });
                        }
                      },
                      child: Container(
                        width: Dimension.width130,
                        height: Dimension.height20 * 3,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimension.radius15 / 2),
                            border: Border.all(
                              color: Colors.black54,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "${endTime.toString().substring(10, 15)}"
                                .text
                                .size(Dimension.font15)
                                .color(Colors.black54)
                                .make(),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ).paddingAll(Dimension.height10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: Dimension.height25 * 1.52,
            ),
            GetBuilder<SignUpController>(builder: (toDo) {
              return GestureDetector(
                onTap: () {
                  dt.setStartTime(startTime);
                  dt.setEndTime(endTime);
                  dt.setDate(date);

                  print("add sucess");

                  // print("lenght of detail " +
                  //     toDo.getDetailList().length.toString());
                  if (widget.istrue) {
                    if (widget.controller.text.isEmpty) {
                      showSnackBar("filled the task name");

                      //  ? print("empty");
                    } else {
                      widget.onEdit!(widget.index);
                    }
                  } else {
                    if (widget.controller.text.isEmpty) {
                      showSnackBar("filled the task name");

                      // print("empty");
                    } else {
                      widget.onSave();
                    }
                  }
                },
                child: Container(
                  width: double.maxFinite,
                  height: Dimension.height50 * 1.2,
                  decoration: BoxDecoration(
                    color: Colors.orange,
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
                    borderRadius: BorderRadius.circular(Dimension.radius15),
                  ),
                  child: "Create Task"
                      .text
                      .bold
                      .color(Vx.white)
                      .size(Dimension.font20)
                      .make()
                      .centered(),
                ),
              );
            })
          ],
        )).pSymmetric(h: Dimension.width15),
      ),
    );
  }
}
