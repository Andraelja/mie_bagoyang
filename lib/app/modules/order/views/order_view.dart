import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar menu dengan jumlah pesanan awal 0
    final List<Map<String, dynamic>> menuItems = [
      {
        "title": "Mie Bagoyang Level 1-5",
        "price": "Rp. 10.000",
        "image": "assets/images/mie_bagoyang.jpg",
        "quantity": 0,
      },
      {
        "title": "Nasi Goreng Spesial",
        "price": "Rp. 15.000",
        "image": "assets/images/nasgor_special.jpg",
        "quantity": 0,
      },
      {
        "title": "Ayam Geprek",
        "price": "Rp. 10.000",
        "image": null,
        "quantity": 0,
      },
      {
        "title": "Mie Rebus",
        "price": "Rp. 12.000",
        "image": "assets/images/mie_rebus.jpg",
        "quantity": 0,
      },
      {
        "title": "Nasi Goreng Biasa",
        "price": "Rp. 10.000",
        "image": null,
        "quantity": 0,
      },
      {
        "title": "Seblak",
        "price": "Rp. 12.000",
        "image": null,
        "quantity": 0,
      },
      {
        "title": "Pecel Lele",
        "price": "Rp. 10.000",
        "image": null,
        "quantity": 0,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Header bagian atas
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 160,
                color: Colors.orange,
              ),
              Positioned(
                top: 40,
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
              ),
              Positioned(
                right: -20,
                top: -20,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 201, 149),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "Go 🍴Mieyang",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 27,
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
              padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          itemCount: menuItems.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                          top: Radius.circular(8),
                                        ),
                                        color: Colors.grey[300],
                                        image: item["image"] != null
                                            ? DecorationImage(
                                                image:
                                                    AssetImage(item["image"]),
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
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      item["price"]!,
                                      style: const TextStyle(
                                        color: Colors.orange,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (item["quantity"] > 0) {
                                              item["quantity"]--;
                                            }
                                          });
                                        },
                                        icon: const Icon(Icons.remove,
                                            color: Colors.red),
                                      ),
                                      Text(
                                        '${item["quantity"]}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            item["quantity"]++;
                                          });
                                        },
                                        icon: const Icon(Icons.add,
                                            color: Colors.green),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final selectedItems = menuItems
                              .where((item) => item["quantity"] > 0)
                              .toList();

                          if (selectedItems.isEmpty) {
                            Get.snackbar(
                              "Pesanan Kosong",
                              "Silakan pilih setidaknya satu menu.",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          } else {
                            String orderSummary = selectedItems.map((item) {
                              return "${item["title"]} x${item["quantity"]}";
                            }).join("\n");

                            Get.snackbar(
                              "Pesanan Dikonfirmasi",
                              "Pesanan Anda:\n$orderSummary",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 32.0),
                        ),
                        child: const Text("Pesan Sekarang"),
                      ),
                    ],
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
