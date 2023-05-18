// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../models/orders/order_status.dart';
import '../../models/payment_type_model.dart';
import '../../models/user_model.dart';
import 'order_product_dto.dart';

class OrderDto {
  final int id;
  final DateTime date;
  final OrderStatus stats;
  final List<OrderProductDto> orderProducts;
  final UserModel user;
  final String address;
  final int cpf;
  final PaymentTypeModel paymentTypeModel;
  OrderDto({
    required this.id,
    required this.date,
    required this.stats,
    required this.orderProducts,
    required this.user,
    required this.address,
    required this.cpf,
    required this.paymentTypeModel,
  });
}
