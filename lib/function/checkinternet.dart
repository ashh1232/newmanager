import 'dart:io';

import 'package:get/get.dart';

// checkInternet() async {
//   try {
//     final result = await InternetAddress.lookup('google.com');
//     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//       return true;
//     }
//   } on SocketException catch (_) {
//     Get.snackbar('Error', 'no internet');
//     return false;
//   }
// }
checkInternet() async {
  try {
    final result = await InternetAddress.lookup('http://localhost:5173/');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    Get.snackbar('Error', 'no internet');
    return true;
  }
}
