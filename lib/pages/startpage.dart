import 'package:codsoft_task2/pages/homepage.dart';
import 'package:codsoft_task2/utils/dimennsions.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class StartPage extends StatefulWidget {
  StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  PageController pageController = PageController();
  var _currentindexno = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(
      () {
        setState(() {
          _currentindexno = pageController.page!;
        });
      },
    );
  }

  List images = [
    "asset/images/work0.jpg",
    "asset/images/work4.png",
    "asset/images/work1.jpg",
  ];
  List content = [
    "Manage Your Everday Task List",
    "Complete Your Task At Time",
    "Manage Your Schedule & Work",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
          controller: pageController,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimension.height70,
                    ),
                    Container(
                        width: double.maxFinite,
                        height: Dimension.height300 * 1.1,
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                      height: Dimension.height25,
                    ),
                    content[index]
                        .toString()
                        .text
                        .size(Dimension.font30 * 1.1)
                        .fontWeight(FontWeight.w600)
                        .make()
                        .marginSymmetric(horizontal: Dimension.width30),
                    SizedBox(
                      height: Dimension.height25,
                    ),
                    "What is a work plan? A work plan is a document that helps everyone want communicate more clearly about the project."
                        .text
                        .size(Dimension.font17)
                        .fontWeight(FontWeight.w500)
                        .make()
                        .marginSymmetric(horizontal: Dimension.width30),
                    SizedBox(
                      height: Dimension.height25,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => HomePage());
                      },
                      child: Container(
                        width: 200,
                        height: 55,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 235, 228, 208)
                                      .withOpacity(0.3),
                                  offset: Offset(1, 1),
                                  blurRadius: 5,
                                  spreadRadius: 1)
                            ],
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.orange),
                        child: "Get Start"
                            .text
                            .color(Vx.white)
                            .size(Dimension.font17)
                            .bold
                            .make()
                            .centered(),
                      ),
                    ),
                    SizedBox(
                      height: Dimension.height10,
                    ),
                    DotsIndicator(
                      dotsCount: images.length,
                      position: _currentindexno.toInt(),
                      decorator: DotsDecorator(
                        activeColor: Colors.orange,
                        // activeColor: Color.fromARGB(255, 50, 132, 231),
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimension.radius5)),
                      ),
                    )
                  ],
                ));
          }),
    );
  }
}
