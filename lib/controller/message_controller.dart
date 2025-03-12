// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class MessageController extends GetxController {
//   var smList = <Map<String, String>>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadSmList();
//   }
//
//   void loadSmList() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (prefs.getString('smList') != null) {
//       smList.value = List<Map<String, String>>.from(
//         (prefs.getString('smList') as List).map(
//           (e) => Map<String, String>.from(e),
//         ),
//       );
//     } else {
//       smList.value = [
//         {
//           'link': 'https://www.facebook.com/profile.php?id=61553765874476',
//           'name': 'facebook',
//           'logoSrc':
//               'https://res.cloudinary.com/dwsuclcox/image/upload/v1701334037/icon/face_wiq2j2.png',
//         },
//         {
//           'link': 'https://www.facebook.com/profile.php?id=61553765874476',
//           'name': 'instagram',
//           'logoSrc':
//               'https://res.cloudinary.com/dwsuclcox/image/upload/v1701334049/icon/inst_oaxabv.png',
//         },
//         {
//           'link': 'https://www.facebook.com/profile.php?id=61553765874476',
//           'name': 'whatsapp',
//           'logoSrc':
//               'https://res.cloudinary.com/dwsuclcox/image/upload/v1701334049/icon/wapp_nu1jjr.png',
//         },
//       ];
//       prefs.setString('smList', smList.toString());
//     }
//   }
// }
