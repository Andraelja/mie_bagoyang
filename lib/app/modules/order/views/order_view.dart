import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        "title": "Mie Bagoyang Level 1-5",
        "price": "Rp. 10.000",
        "image": "assets/images/mie_bagoyang.jpg",
      },
      {
        "title": "Nasi Goreng Spesial",
        "price": "Rp. 15.000",
        "image": null,
      },
      {
        "title": "Ayam Geprek",
        "price": "Rp. 10.000",
        "image": null,
      },
      {
        "title": "Mie Rebus",
        "price": "Rp. 12.000",
        "image": null,
      },
      {
        "title": "Nasi Goreng Biasa",
        "price": "Rp. 10.000",
        "image": null,
      },
      {
        "title": "Seblak",
        "price": "Rp. 12.000",
        "image": null,
      },
      {
        "title": "Pecel Lele",
        "price": "Rp. 10.000",
        "image": null,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Header bagian atas
          Stack(
            children: [
              // Rectangle sebagai latar belakang utama
              Container(
                width: double.infinity,
                height: 160, // Tinggi diperbesar untuk memberi ruang tambahan
                color: Colors.orange,
              ),
              // Icon back di atas
              Positioned(
                top: 40, // Posisikan icon back
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
              ),
              // Lingkaran di sekitar teks
              Positioned(
                right: -20, // Geser lingkaran ke kanan
                top: -20, // Teks lebih ke bawah
                child: Container(
                  width: 250, // Lebar lingkaran
                  height: 250, // Tinggi lingkaran
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 201, 149),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "Go 🍴Mieyang",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 27, // Ukuran teks
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Grid menu
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                  16.0, 32.0, 16.0, 16.0), // Tambahkan padding atas
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: GridView.builder(
                itemCount: menuItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Gambar menu
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(8),
                              ),
                              color: Colors.grey[300],
                              image: item["image"] != null
                                  ? DecorationImage(
                                      image: AssetImage(item["image"]),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: item["image"] == null
                                ? const Center(
                                    child: Icon(
                                      Icons.fastfood,
                                      size: 40,
                                      color: Colors.grey,
                                    ),
                                  )
                                : null,
                          ),
                        ),
                        // Nama menu
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item["title"]!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // Harga menu
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            item["price"]!,
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
