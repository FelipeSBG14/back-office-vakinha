// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/ui/styles/text_styles.dart';
import '../../../models/orders/order_model.dart';

class OrderItem extends StatelessWidget {
  final OrderModel order;
  const OrderItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    'Pedido',
                    style: textStyles.textBold,
                  ),
                  Text(
                    '1',
                    style: textStyles.textExtraBold,
                  ),
                  Expanded(
                    child: Text(
                      'Cancelado',
                      style: textStyles.textExtraBold
                          .copyWith(fontSize: 20, color: Colors.red),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                    height: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ),
        const VerticalDivider(
          thickness: 1,
          color: Colors.grey,
        )
      ],
    );
  }
}
