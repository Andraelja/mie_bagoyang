import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // PageView controller
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  final int totalPages = 3; // Jumlah total halaman banner yang dinamis

  // Daftar jumlah barang untuk setiap item menu
  final RxList<int> itemCounts = List<int>.generate(4, (index) => 0).obs;

  // Hitung total barang yang dipilih
  int get totalItems => itemCounts.reduce((a, b) => a + b);

  @override
  void onInit() {
    super.onInit();
    _startAutoSlide();
  }

  // Fungsi auto-slide untuk banner
  void _startAutoSlide() {
    Future.delayed(const Duration(seconds: 3), _autoSlide);
  }

  void _autoSlide() {
    if (!pageController.hasClients) {
      return; // Mencegah error jika controller belum terpasang
    }

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

  // Fungsi untuk menambah jumlah item
  void incrementItem(int index) {
    itemCounts[index]++;
  }

  // Fungsi untuk mengurangi jumlah item
  void decrementItem(int index) {
    if (itemCounts[index] > 0) {
      itemCounts[index]--;
    }
  }
}
