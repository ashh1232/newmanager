import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newmanager/class/handlingdatacontroll.dart';
import 'package:newmanager/class/statusrequest.dart';
import 'package:newmanager/data/remote/update_remote.dart';

class AddController extends GetxController {
  ProductRemote productRemote = ProductRemote(Get.find());
  late StatusRequest statusRequest;

  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;
  late TextEditingController imageController;
  @override
  void onInit() {
    nameController = TextEditingController();
    priceController = TextEditingController();
    imageController = TextEditingController();
    super.onInit();
  }

  addNewData() async {
    statusRequest = StatusRequest.loading;
    var respo = await productRemote.addData(
      nameController.text,
      priceController.text,
      imageController.text,
    );
    statusRequest = handlingData(respo);
    if (respo['status'] == 'success') {
      Get.snackbar('add data ', 'Success');
    } else {}
    update();
  }
}
