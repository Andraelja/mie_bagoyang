import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_bagoyang/app/modules/home/controllers/home_controller.dart'; // Pastikan ini sesuai dengan lokasi controller Anda
import 'package:mie_bagoyang/app/modules/home/views/home_view.dart';
import 'package:mie_bagoyang/app/modules/login/views/login_view.dart';
import 'package:mie_bagoyang/app/modules/main_navigation/views/main_navigation_view.dart';
import 'package:mie_bagoyang/app/modules/register/views/register_view.dart';
import 'app/routes/app_pages.dart';

void main() {
  // Inisialisasi GetX Controller
  Get.put(
      HomeController()); // Memastikan HomeController tersedia di seluruh aplikasi

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginView(),
        ),
        GetPage(
          name: '/main_navigation',
          page: () => MainNavigationView(),
        ),
        GetPage(
          name: '/register',
          page: () => RegisterView(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeView(),
        ),
      ],
    ),
  );
}
