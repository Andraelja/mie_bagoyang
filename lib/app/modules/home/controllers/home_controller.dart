import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  final int totalPages = 3; // Jumlah total halaman yang dinamis

  @override
  void onInit() {
    super.onInit();
    _startAutoSlide();
  }
  

  void _startAutoSlide() {
    Future.delayed(const Duration(seconds: 3), _autoSlide);
  }

  void _autoSlide() {
    if (!pageController.hasClients)
      return; // Mencegah error jika controller belum terpasang

    if (currentPage.value < totalPages - 1) {
      pageController.animateToPage(
        currentPage.value + 1,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    } else {
      pageController.animateToPage(
        0,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }

    currentPage.value = (currentPage.value + 1) % totalPages;
    _startAutoSlide(); // Melanjutkan auto-slide
  }

  @override
  void onClose() {
    pageController.dispose(); // Membersihkan resource
    super.onClose();
  }
}
