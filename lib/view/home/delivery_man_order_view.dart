import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DeliveryManOrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mock data for orders
    List<Order> orders = [
      Order(
        foodName: 'Pizza',
        quantity: 2,
        location: '123 Main St',
        image: 'assets/img/res_1.png',
      ),
      Order(
        foodName: 'Burger',
        quantity: 1,
        location: '456 Oak St',
        image: 'assets/img/shop_logo.png',
      ),
      Order(
        foodName: 'Deserts',
        quantity: 3,
        location: '789 Elm St',
        image: 'assets/img/menu_3.png',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Orders'.tr()),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  orders[index].image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  '${orders[index].foodName} - ${orders[index].quantity}',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text('Location: ${orders[index].location}'.tr()),
                trailing: IconButton(
                  icon: Icon(Icons.delivery_dining),
                  onPressed: () {
                    // Implement delivery functionality here
                  },
                ),
                onTap: () {
                  // Implement any functionality when tapping on an order
                  // For example, navigate to a screen to view order details
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class Order {
  final String foodName;
  final int quantity;
  final String location;
  final String image;

  Order({
    required this.foodName,
    required this.quantity,
    required this.location,
    required this.image,
  });
}
