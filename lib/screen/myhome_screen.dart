import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newmanager/controller/testcontroller.dart';
import 'discover_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  final int cartItemCount = 0;
  final bool isNavCatVisible = true;

  @override
  Widget build(BuildContext context) {
    final TestControsller controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: const Text(
          'دكانه',
          style: TextStyle(
            fontFamily: 'Noto Nastaliq Urdu',
            fontWeight: FontWeight.w100,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.mail),
            onPressed: () {
              Navigator.pushNamed(context, '/mail');
            },
          ),
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.favorite), onPressed: () {}),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_bag),
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
              if (cartItemCount > 0)
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '$cartItemCount',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0),
              offset: Offset(4, 4),
            ),
            BoxShadow(
              color: Colors.red,
              offset: Offset(-44, -4),
              spreadRadius: 55,
            ),
          ],
        ),

        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Visibility(
                visible: isNavCatVisible,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    boxShadow: [
                      BoxShadow(color: Colors.black),
                      BoxShadow(color: Colors.black),
                    ],
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                        child: const Text('المتجر'),
                      ),
                      const SizedBox(width: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/salon');
                        },
                        child: const Text('الصالون'),
                      ),
                      const SizedBox(width: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/shada');
                        },
                        child: const Text('نيون'),
                      ),
                      const SizedBox(width: 20),
                      DropdownButton<String>(
                        onChanged: (String? newValue) {},
                        items:
                            <String>[
                              'شده',
                              'Action',
                              'Another action',
                              'تسجيل الخروج',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                        hint: const Text('الاعدادات'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.height - 200,
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.updatePage,
                children: [
                  HomeScreen(),
                  DiscoverScreen(), // يستخدم DiscoverController الخاص به
                  UserPage(),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Obx(
        () => Container(
          color: Colors.grey.shade300,
          child: BottomNavigationBar(
            backgroundColor: Colors.grey.shade300,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'الملف'),
            ],
            currentIndex: controller.currentPage.value,
            selectedItemColor: Colors.amber,
            onTap: (index) => controller.pageController.jumpToPage(index),
          ),
        ),
      ),
    );
  }
}
