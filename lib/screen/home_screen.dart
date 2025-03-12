import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newmanager/class/handlingdataview.dart';
import 'package:newmanager/controller/testcontroller.dart';
import 'package:newmanager/screen/detail.dart';
import '../widget/card_home_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TestControsller testControsller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: GetBuilder<TestControsller>(
        builder:
            (controller) => Column(
              children: [
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    //main category list
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.mcat.length,
                    itemBuilder:
                        (x, s) => InkWell(
                          onTap: () {
                            controller.mCatSel(
                              controller.mcat[s]['categories_id'],
                              controller.mcat[s]['m_cat_id'],
                            );
                          },
                          child: Container(
                            width: 120,
                            height: 40,
                            // margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade500),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  controller.mcat[s]['is_on'] == '1'
                                      ? Colors.black87
                                      : Colors.grey,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Text(
                              controller.mcat[s]['m_cat_name'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color:
                                    controller.mcat[s]['is_on'] == '1'
                                        ? Colors.white70
                                        : Colors.black,
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
                // ),
                // ),
                SizedBox(
                  height: context.height - 240,
                  child: Row(
                    children: [
                      SizedBox(
                        //product list
                        width: context.mediaQuerySize.width - 100,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: GestureDetector(
                                onTap: () => controller.gotoAdd(),
                                child: Card(
                                  child: const Icon(
                                    Icons.add_outlined,
                                    color: Color.fromARGB(255, 116, 116, 116),
                                    size: 36.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.mediaQuerySize.height - 350,
                              child: GetBuilder<TestControsller>(
                                builder: (controller) {
                                  return Handlingdataview(
                                    statusRequest: controller.statusRequest,
                                    widget: Container(
                                      padding: EdgeInsets.only(top: 12),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.grey.shade300,
                                            Colors.grey.shade400,
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),

                                      child: GridView.builder(
                                        padding: EdgeInsets.all(9),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 22,
                                              mainAxisSpacing: 22,
                                            ),
                                        itemCount: controller.proCat.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) => DetailPage(
                                                        data:
                                                            controller
                                                                .proCat[index],
                                                      ),
                                                ),
                                              );
                                            },
                                            child: HomeCard(
                                              data: controller.proCat,
                                              index: index,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100,

                        child: ListView.builder(
                          //category list
                          itemCount: testControsller.scat.length,
                          itemBuilder:
                              (d, b) => InkWell(
                                onTap: () {
                                  controller.sCatSel(
                                    testControsller.scat[b]['categories_id'],
                                  );
                                },
                                child: Container(
                                  width: 120,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade500,
                                    ),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.grey.shade100,
                                        controller.scat[b]['is_on'] == '3'
                                            ? Colors.grey.shade300
                                            : Colors.black45,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),

                                  child: Text(
                                    testControsller.scat[b]['categories_name'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
