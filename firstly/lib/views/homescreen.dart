import 'package:firstly/views/bookings.dart';
import 'package:firstly/views/dashboard.dart';
import 'package:firstly/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt currentIndex = 0.obs;
  void changePage(int index) => currentIndex.value = index;
}

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final HomeController homeController = Get.put(HomeController());

  final List<Widget> _views = [Dashboard(), Bookings(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _views[homeController.currentIndex.value],
        bottomNavigationBar: CurvedNavigationBar(
          index: homeController.currentIndex.value,
          backgroundColor: Colors.white,
          color: const Color(0xFF0077B6),
          buttonBackgroundColor: const Color(0xFF00B4D8),
          animationDuration: const Duration(milliseconds: 300),
          items: const [
            Icon(Icons.home_rounded, size: 28, color: Colors.white),
            Icon(Icons.bookmark_rounded, size: 28, color: Colors.white),
            Icon(Icons.person_rounded, size: 28, color: Colors.white),
          ],
          onTap: (index) {
            homeController.changePage(index);
          },
        ),
      ),
    );
  }
}
