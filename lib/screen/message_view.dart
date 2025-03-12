// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../controller/message_controller.dart';
//
// class MessageView extends StatelessWidget {
//   // final MessageController controller = Get.put(MessageController());
//
//   MessageView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Message View')),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Obx(() {
//           return ListView.builder(
//             itemCount: controller.smList.length,
//             itemBuilder: (context, index) {
//               var crt = controller.smList[index];
//               return Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Card(
//                   child: ListTile(
//                     leading: Image.network(crt['logoSrc']!),
//                     title: Text('التواصل من خلال ${crt['name']}'),
//                     onTap: () async {
//                       var url = crt['link']!;
//                       if (await canLaunchUrl(url as Uri)) {
//                         await launchUrl(url as Uri);
//                       } else {
//                         throw 'Could not launch $url';
//                       }
//                     },
//                   ),
//                 ),
//               );
//             },
//           );
//         }),
//       ),
//     );
//   }
// }
