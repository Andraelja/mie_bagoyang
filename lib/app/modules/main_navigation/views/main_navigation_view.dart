import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_navigation_controller.dart';

class MainNavigationView extends GetView<MainNavigationController> {
  const MainNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          // Menampilkan judul berbeda berdasarkan halaman yang dipilih
          switch (controller.currentIndex.value) {
            case 0:
              return const Text('Home');
            case 1:
              return const Text('Order');
            case 2:
              return const Text('Scan QR');
            case 3:
              return const Text('Riwayat');
            case 4:
              return const Text('Akun');
            default:
              return const Text('MainNavigationView');
          }
        }),
        centerTitle: true,
      ),
      body: Obx(() {
        // Menampilkan halaman yang sesuai dengan tab yang dipilih
        switch (controller.currentIndex.value) {
          case 0:
            return const Center(
              child: Text(
                'Home Page',
                style: TextStyle(fontSize: 20),
              ),
            );
          case 1:
            return const Center(
              child: Text(
                'Order Page',
                style: TextStyle(fontSize: 20),
              ),
            );
          case 2:
            return const Center(
              child: Text(
                'Scan QR Page',
                style: TextStyle(fontSize: 20),
              ),
            );
          case 3:
            return const Center(
              child: Text(
                'Riwayat Page',
                style: TextStyle(fontSize: 20),
              ),
            );
          case 4:
            return const Center(
              child: Text(
                'Akun Page',
                style: TextStyle(fontSize: 20),
              ),
            );
          default:
            return const Center(
              child: Text(
                'Page not found',
                style: TextStyle(fontSize: 20),
              ),
            );
        }
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            // Mengubah indeks tab saat dipilih
            controller.currentIndex.value = index;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner),
              label: 'Scan QR',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Akun',
            ),
          ],
        ),
      ),
    );
  }
}
