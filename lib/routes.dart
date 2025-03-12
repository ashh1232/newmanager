import 'package:get/get.dart';
import 'package:newmanager/binding/home_binding.dart';
import 'package:newmanager/screen/add_screen.dart';
import 'package:newmanager/screen/cart_screen.dart';
// import 'package:manneger/screen/detail.dart';
import 'package:newmanager/screen/home_screen.dart';
import 'package:newmanager/screen/message_view.dart';
import 'package:newmanager/screen/salon_screen.dart';
import 'package:newmanager/screen/shada_screen.dart';
import 'screen/discover_screen.dart';
import 'screen/myhome_screen.dart';
import 'screen/profile_screen.dart';

final List<GetPage> getPages = [
  GetPage(name: '/', page: () => MyHomePage(), binding: HomeBinding()),
  GetPage(name: '/home', page: () => HomeScreen()),
  GetPage(name: '/profile', page: () => UserPage()),
  GetPage(name: '/discover', page: () => DiscoverScreen()),
  // GetPage(name: '/mail', page: () => MessageView()),
  GetPage(name: '/cart', page: () => CartView()),
  GetPage(name: '/salon', page: () => SalonView()),
  // GetPage(name: '/shada', page: () => ShadaPage()),
  GetPage(name: '/addpage', page: () => AddScreen()),
  // GetPage(name: '/detail', page: () => DetailPage()),..oppp
];
