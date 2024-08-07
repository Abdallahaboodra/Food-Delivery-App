import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantOwnerHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Owner').tr(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome, Restaurant Owner!'.tr(),
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrdersPage()),
                  );
                },
                icon: Icon(Icons.assignment),
                label: Text('View Orders').tr(),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RestaurantSalesScreen()),
                  );
                },
                icon: Icon(Icons.attach_money),
                label: Text('View Sales').tr(),
              ),
              // Add more buttons or content as needed
            ],
          ),
        ),
      ),
    );
  }
}

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<Order> orders = [
    Order(orderNumber: 1, items: ['pizza', 'Sea Food'], isAccepted: false),
    Order(orderNumber: 1, items: ['food', 'Burger'], isAccepted: false),
    Order(orderNumber: 1, items: ['pizza', 'Sea Food'], isAccepted: false),
    Order(orderNumber: 1, items: ['food', 'Burger'], isAccepted: false),
    Order(orderNumber: 1, items: ['food', 'fish'], isAccepted: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available orders').tr(),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return OrderCard(order: orders[index]);
        },
      ),
    );
  }
}

class Order {
  final int orderNumber;
  final List<String> items;
  bool isAccepted;

  Order(
      {required this.orderNumber,
      required this.items,
      required this.isAccepted});
}

class OrderCard extends StatelessWidget {
  final Order order;

  OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Dial a number${order.orderNumber}').tr(),
        subtitle: Text('Items: ${order.items.join(", ")}').tr(),
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            'assets/img/${order.items[0].toLowerCase()}.png',
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                // Accept order
                order.isAccepted = true;
                // Update UI
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content:
                          Text('تم قبول الطلب رقم ${order.orderNumber}'.tr())),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantSalesScreen extends StatefulWidget {
  @override
  _RestaurantSalesScreenState createState() => _RestaurantSalesScreenState();
}

class _RestaurantSalesScreenState extends State<RestaurantSalesScreen> {
  String _itemImage = 'assets/img/res_2.png'; // Default image path
  double _itemPrice = 0.0; // Default item price
  String _foodType = ''; // Default food type

  List<Map<String, dynamic>> _salesList = [];
  double _totalPrice = 0.0;

  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _foodTypeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSalesData();
  }

  void _addItem() {
    setState(() {
      _salesList.add({
        "item": _foodType.isNotEmpty ? _foodType : "Item",
        "price": _itemPrice,
        "imagePath": _itemImage,
      });
      _totalPrice += _itemPrice;
    });
    _saveSalesData();
  }

  void _loadSalesData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('salesData');

    if (jsonString != null) {
      final List<Map<String, dynamic>> savedData =
          List<Map<String, dynamic>>.from(json.decode(jsonString));
      setState(() {
        _salesList = savedData;
        _totalPrice = _salesList.fold(0, (sum, item) => sum + item['price']);
      });
    }
  }

  void _saveSalesData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(_salesList);
    prefs.setString('salesData', jsonString);
  }

  @override
  void dispose() {
    _priceController.dispose();
    _foodTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Sales'.tr()),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Sales Record'.tr(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _salesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.asset(_salesList[index]["imagePath"]),
                    title: Text(_salesList[index]["item"]),
                    subtitle: Text('\$${_salesList[index]["price"]}'),
                  );
                },
              ),
            ),
            Divider(),
            Text(
              'Total: \$$_totalPrice'.tr(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _foodTypeController,
              decoration: InputDecoration(
                labelText: 'Food Type'.tr(),
              ),
              onChanged: (value) {
                setState(() {
                  _foodType = value;
                });
              },
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                labelText: 'Item Price'.tr(),
              ),
              onChanged: (value) {
                setState(() {
                  _itemPrice = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                _addItem(); // Add item with default image and price
              },
              child: Text('Add Item').tr(),
            ),
          ],
        ),
      ),
    );
  }
}
