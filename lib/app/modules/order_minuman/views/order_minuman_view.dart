import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_minuman_controller.dart';

class OrderMinumanView extends GetView<OrderMinumanController> {
  const OrderMinumanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrderMinumanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OrderMinumanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
