import 'dart:ffi';

class Order {
  final int? id;
  final String date;
  final String items;
  final String total_items;
  final String total_price;
  final String? customer_id;
  final String? order_id;

  Order(
      {this.id,
        required this.date,
        required this.items,
        required this.total_items,
        required this.total_price,
        this.customer_id,
        this.order_id
      });

  Order.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        date = res["date"],
        items = res["items"],
        total_items = res["total_items"],
        total_price = res["total_price"],
        order_id = res["order_id"],
        customer_id = res["customer_id"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'date': date,
      'items': items,
      'total_items': total_items,
      'total_price': total_price,
      'customer_id': customer_id,
      'order_id':order_id,
    };
  }
}
