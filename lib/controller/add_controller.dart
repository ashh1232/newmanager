import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newmanager/class/handlingdatacontroll.dart';
import 'package:newmanager/class/statusrequest.dart';
import 'package:newmanager/controller/testcontroller.dart';
import 'package:newmanager/data/remote/update_remote.dart';

class AddController extends GetxController {
  TestControsller testControsller = Get.put(TestControsller());
  ProductRemote productRemote = ProductRemote(Get.find());
  late StatusRequest statusRequest;

  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;
  late TextEditingController imageController;
  int curent = 0;
  @override
  void onInit() {
    nameController = TextEditingController();
    priceController = TextEditingController();
    imageController = TextEditingController();
    super.onInit();
  }

  selCattt(int inn) {
    curent = inn;
    update();
  }

  addNewData() async {
    try {
      statusRequest = StatusRequest.loading;
      var respo = await productRemote.addData(
        nameController.text,
        priceController.text,
        imageController.text,
      );
      statusRequest = handlingData(respo);
      print(respo);
      if (respo['status'] == 'success') {
        Get.snackbar('add data ', 'Success');
        testControsller.getData();
      } else {
        print('object');
      }
    } catch (s) {
      print(s);
    }
    update();
    Get.offAndToNamed('/');
  }
}
