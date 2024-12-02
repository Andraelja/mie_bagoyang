import 'package:get/get.dart';

class MainNavigationController extends GetxController {
  // Index untuk tab yang aktif
  var currentIndex = 0.obs;

  // Fungsi untuk mengubah tab
  void changeTab(int index) {
    currentIndex.value = index;
  }
}
