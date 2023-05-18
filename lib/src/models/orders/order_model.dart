// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'order_product_model.dart';
import 'order_status.dart';

class OrderModel {
  final int id;
  final DateTime date;
  final OrderStatus status;
  final List<OrderProductModel> orderProducts;
  final int userId;
  final String address;
  final int cpf;
  final int paymentTypeId;
  OrderModel({
    required this.id,
    required this.date,
    required this.status,
    required this.orderProducts,
    required this.userId,
    required this.address,
    required this.cpf,
    required this.paymentTypeId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date.toIso8601String(),
      'status': status.acronym,
      'products': orderProducts.map((x) => x.toMap()).toList(),
      'userId': userId,
      'address': address,
      'cpf': cpf,
      'paymentTypeId': paymentTypeId,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as int,
      date: DateTime.parse(map['date']),
      status: OrderStatus.parse(map['status']),
      orderProducts: List<OrderProductModel>.from(
        (map['products']).map<OrderProductModel>(
          (x) => OrderProductModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      userId: map['user_id'] as int,
      address: map['address'] as String,
      cpf: map['CPF'] as int,
      paymentTypeId: (map['payment_method_id'] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
