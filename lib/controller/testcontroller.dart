import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newmanager/class/handlingdatacontroll.dart';
import 'package:newmanager/class/statusrequest.dart';
import 'package:newmanager/data/remote/test.dart';

class TestControsller extends GetxController {
  TestData testdata = TestData(Get.find());
  final PageController pageController = PageController();

  List data = [];
  List cat = [];
  List proCat = [];
  List mcat = [];
  List scat = [];
  late StatusRequest statusRequest;

  void mCatSel(int cId, int id) {
    for (int j = 0; j < mcat.length; j++) {
      if (mcat[j]['m_cat_id'] == id) {
        mcat[j]['is_on'] = '1';
      } else {
        mcat[j]['is_on'] = '0';
      }
    }
    scat = [];
    scat.addAll(cat.where((test) => test['m_cat_id'] == id));

    update();
  }

  void sCatSel(int id) {
    for (int j = 0; j < scat.length; j++) {
      if (scat[j]['categories_id'] == id) {
        scat[j]['is_on'] = '3';
      } else {
        scat[j]['is_on'] = '4';
      }
    }
    proCat = [];
    // proCat = data;
    proCat.addAll(data.where((tes) => (tes['categories_id'] == id)));
    update();
  }

  gotoAdd() {
    Get.toNamed('/addpage');
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var respo = await testdata.getdata();
    statusRequest = handlingData(respo);
    if (statusRequest == StatusRequest.success) {
      if (respo['status'] == "success") {
        data.clear();
        data.addAll(respo['data']);
        proCat.clear();

        proCat.addAll(respo['data']);
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  getCat() async {
    statusRequest = StatusRequest.loading;
    var res = await testdata.getCatt();
    statusRequest = handlingData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == 'success') {
        cat.clear();
        scat.clear();
        cat.addAll(res['data']);
        scat.addAll(res['data']);

        for (int h = 0; h < cat.length; h++) {
          if (mcat.isEmpty) {
            mcat.add(cat[h]);
          } else {
            bool dd = true;
            for (int k = 0; k < mcat.length; k++) {
              if (mcat[k]['m_cat_name'] == cat[h]['m_cat_name']) {
                dd = false;
              }
            }
            if (dd == true) {
              mcat.add(cat[h]);
            }
          }
        }
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    getCat();
    super.onInit();
  }

  bool isNavCatVisible = false;
  RxInt currentPage = 0.obs;
  void updatePage(int index) {
    currentPage.value = index;
  }

  void toggleNavCat() {
    (() {
      isNavCatVisible = !isNavCatVisible;
    });
    update();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
