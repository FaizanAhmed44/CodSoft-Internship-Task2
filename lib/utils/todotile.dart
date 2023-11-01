import 'package:codsoft_task2/utils/dimennsions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskDescription;
  final String taskName;
  final bool taskCompleted;
  final String startTime;
  final String endTime;
  final String date;
  VoidCallback editFunction;
  // Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    // required this.onChanged,
    required this.editFunction,
    required this.endTime,
    required this.startTime,
    required this.deleteFunction,
    required this.taskCompleted,
    required this.taskName,
    required this.taskDescription,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
          onPressed: deleteFunction,
          icon: Icons.delete,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(Dimension.radius20),
        )
      ]),
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(
            bottom: Dimension.height10 / 1.6,
            left: Dimension.width4 * 2,
            right: Dimension.width4 * 2,
            top: Dimension.height10 / 1.7),
        height: Dimension.height120 * 1.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimension.radius20),
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
            color: Vx.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "${taskName}"
                    .text
                    .size(Dimension.font25 / 1.1)
                    .bold
                    .color(Colors.orange)
                    .ellipsis
                    .make(),
                GestureDetector(
                  onTap: () {
                    editFunction();
                  },
                  child: Container(
                    width: Dimension.width30 / 1.1,
                    // color: Vx.amber500,
                    height: Dimension.height30 / 1.1,
                    child: Image.asset(
                      "asset/images/edit1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ).pOnly(right: Dimension.width10 / 1.22),
            // SizedBox(
            //   height: Dimension.height10 / 2.2,
            // ),
            "${taskDescription}"
                .text
                .ellipsis
                .size(Dimension.font15)
                .color(Colors.black54)
                .make(),
            // SizedBox(
            //   height: Dimension.height15,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.watch_later,
                      color: Colors.orange,
                      size: Dimension.icon30 / 1.1,
                    ),
                    SizedBox(
                      width: Dimension.width10 / 1.1,
                    ),
                    "${startTime.substring(10, 15)} to  ${endTime.substring(10, 15)}"
                        .text
                        .size(Dimension.font15)
                        .color(Colors.black)
                        .make(),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.date_range_outlined,
                      color: Colors.orange,
                      size: Dimension.icon30 / 1.1,
                    ),
                    SizedBox(
                      width: Dimension.width10 / 1.1,
                    ),
                    "${date.substring(0, 10)}"
                        .text
                        .size(Dimension.font15)
                        .color(Colors.black)
                        .make(),
                  ],
                ),
              ],
            ).pOnly(right: Dimension.width4 / 1.12)
          ],
        ).pOnly(
            left: Dimension.width20,
            // top: Dimension.height15,
            right: Dimension.width10),
      ),
    ).marginOnly(bottom: Dimension.height15);
  }
}
