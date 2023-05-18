import 'package:flutter/material.dart';
import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../models/payment_type_model.dart';
import '../payment_type_controller.dart';

class PaymentTypeItem extends StatelessWidget {
  final PaymentTypeModel payment;
  final PaymentTypeController controller;

  const PaymentTypeItem({
    Key? key,
    required this.payment,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorAll = payment.enabled ? Colors.black : Colors.grey;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Image.asset(
              'assets/images/icons/payment_${payment.acronym}_icon.png',
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/icons/payment_notfound_icon.png',
                  color: colorAll,
                );
              },
              color: colorAll,
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      'Forma de Pagamento',
                      style: context.textStyles.textRegular.copyWith(
                        color: colorAll,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FittedBox(
                    child: Text(
                      payment.name,
                      style: context.textStyles.textTitle.copyWith(
                        color: colorAll,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    controller.editPayment(payment);
                  },
                  child: Text(
                    'Editar',
                    style: context.textStyles.textMedium.copyWith(
                      color: payment.enabled
                          ? context.colors.primary
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
