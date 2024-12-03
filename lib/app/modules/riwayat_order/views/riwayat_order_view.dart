import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/riwayat_order_controller.dart';

class RiwayatOrderView extends GetView<RiwayatOrderController> {
  const RiwayatOrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiwayatOrderView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RiwayatOrderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
