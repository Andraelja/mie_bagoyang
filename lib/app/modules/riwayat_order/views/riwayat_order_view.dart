import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mie_bagoyang/app/modules/home/views/home_view.dart';
import 'package:mie_bagoyang/app/shared/theme.dart';

import '../controllers/riwayat_order_controller.dart';

class RiwayatOrderView extends GetView<RiwayatOrderController> {
  const RiwayatOrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          // Bagian Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: const Text(
              'Riwayat Order',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Bagian Isi
          Expanded(
            child: Container(
              color: Colors.orange,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nama User: INDAH',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Tanggal Pemesanan: 19/11/2024',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Detail Pesanan:',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Mie Bagoyang : Rp.15.000.00\n'
                        'Jus Alpukat  : Rp.8.000.00\n'
                        'Mie Rebus    : Rp.8.000.00\n'
                        '---------------------------\n'
                        'Total        : Rp.31.000.00',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primary, // Ganti dengan warna yang diinginkan
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomePage()), // Ganti HomePage dengan halaman Home Anda
                              );
                            },
                            child: const Text('Selesai'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primary,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                            ),
                            onPressed: () {
                              // Aksi tombol Bagikan
                            },
                            child: const Text('Bagikan'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
