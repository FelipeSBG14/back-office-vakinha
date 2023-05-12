import 'package:flutter/material.dart';

import '../../../core/ui/widgets/base_header.dart';

class PaymentTypeHeader extends StatelessWidget {
  const PaymentTypeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseHeader(
      title: 'ADMINISTRAR FORMAS DE PAGAMENTO',
      buttonLabel: 'ADICIONAR',
      buttonPressed: () {},
      filterWidget: DropdownButton<bool>(
        value: true,
        items: const [
          DropdownMenuItem(
            value: null,
            child: Text('Todos'),
          ),
          DropdownMenuItem(
            value: true,
            child: Text('Ativos'),
          ),
          DropdownMenuItem(
            value: false,
            child: Text('Inativos'),
          ),
        ],
        onChanged: (value) {},
      ),
    );
  }
}
