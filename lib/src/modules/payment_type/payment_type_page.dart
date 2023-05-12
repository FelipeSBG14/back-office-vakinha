import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import 'payment_type_controller.dart';
import 'widgets/payment_type_form/payment_type_modal.dart';
import 'widgets/payment_type_header.dart';
import 'widgets/payment_type_item.dart';

class PaymentTypePage extends StatefulWidget {
  const PaymentTypePage({Key? key}) : super(key: key);

  @override
  State<PaymentTypePage> createState() => _PaymentTypePageState();
}

class _PaymentTypePageState extends State<PaymentTypePage>
    with Loader, Messages {
  final controller = Modular.get<PaymentTypeController>();

  final disposer = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final filterDisposer = reaction((_) => controller.filterEnabled, (_) {
          controller.loadPayments();
        });
        final statusDisposer = reaction(
          (_) => controller.status,
          (status) {
            switch (status) {
              case PaymentTypeStateStatus.initial:
                break;
              case PaymentTypeStateStatus.loading:
                showLoader();
                break;
              case PaymentTypeStateStatus.loaded:
                hideLoader();
                break;
              case PaymentTypeStateStatus.error:
                hideLoader();
                showError(
                  controller.errorMessage ??
                      'Erro ao buscar formas de pagamento',
                );
                break;
              case PaymentTypeStateStatus.addOrUpdatePayment:
                hideLoader();
                showAddOrUpdatePayment();
                break;
              case PaymentTypeStateStatus.saved:
                hideLoader();
                Navigator.of(context, rootNavigator: true).pop();
                controller.loadPayments();
                break;
            }
          },
        );
        disposer.addAll([
          statusDisposer,
          filterDisposer,
        ]);
        controller.loadPayments();
      },
    );
  }

  @override
  void dispose() {
    for (final dispose in disposer) {
      dispose();
    }
    super.dispose();
  }

  void showAddOrUpdatePayment() {
    showDialog(
      context: context,
      builder: (context) {
        return Material(
          color: Colors.black26,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.white,
            elevation: 10,
            child: PaymentTypeModal(
              model: controller.paymentTypeSelected,
              controller: controller,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.only(
        left: 40,
        top: 40,
        right: 40,
      ),
      child: Column(
        children: [
          PaymentTypeHeader(
            controller: controller,
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                return GridView.builder(
                  itemCount: controller.paymentTypes.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisExtent: 120,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    maxCrossAxisExtent: 680,
                  ),
                  itemBuilder: (context, index) {
                    final paymentTypeModel = controller.paymentTypes[index];
                    return PaymentTypeItem(
                      payment: paymentTypeModel,
                      controller: controller,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
