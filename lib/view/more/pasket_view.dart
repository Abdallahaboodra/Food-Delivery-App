import 'package:flutter/material.dart';
import 'package:food_delivery/view/more/my_order_provider.dart';
import 'package:provider/provider.dart';

class MyOrderDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyOrderDataProvider>(
      builder: (context, orderProvider, child) {
        if (orderProvider.addOrderData.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              title: Text(''),
            ),
            body: Center(
              child: Text('No orders yet'),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('My Orders'),
            ),
            body: ListView.builder(
              itemCount: orderProvider.addOrderData.length,
              itemBuilder: (context, index) {
                MyOrderData orderData = orderProvider.addOrderData[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total: SAR ${orderData.total}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Order Name: ${orderData.NameOrder}',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Location: ${orderData.location ?? 'Not specified'}',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Image.asset(
                            orderData.image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
