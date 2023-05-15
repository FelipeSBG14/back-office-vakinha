import 'package:flutter/material.dart';

import 'widget/order_header.dart';
import 'widget/order_item.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrains) {
        return Container(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              const OrderHeader(),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisExtent: 91,
                    maxCrossAxisExtent: 600,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return OrderItem();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
