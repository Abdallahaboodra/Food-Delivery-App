import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../menu/item_details_view.dart';

class ItalianFoodView extends StatelessWidget {
  final List<Map<String, dynamic>> foodList = [
    {
      "name": "Pizza Margherita",
      "salary": 105,
      "image": "assets/img/Pizza Margherita.jpg",
    },
    {
      "name": "Spaghetti Carbonara",
      "salary": 20,
      "image": "assets/img/Spaghetti Carbonara.jpg",
    },
    {
      "name": "Lasagna",
      "salary": 35,
      "image": "assets/img/Lasagna.jpg",
    },
    {
      "name": "Risotto",
      "salary": 45,
      "image": "assets/img/Risotto.jpg",
    },
    {
      "name": "Bruschetta",
      "salary": 65,
      "image": "assets/img/Bruschetta.jpg",
    },
    // Add more Italian food items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('food menue'.tr()),
      ),
      body: ListView.builder(
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (
                context,
              ) {
                return ItemDetailsView(
                  foodName: foodList[index]['name'],
                  foodSalary:
                      double.parse(foodList[index]['salary'].toString()),
                  foodImage: foodList[index]['image'],
                );
              }));
            },
            child: Card(
              elevation: 2,
              margin: EdgeInsets.all(8),
              child: ListTile(
                leading: Image.asset(
                  foodList[index]['image'],
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  foodList[index]['name'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Salary: ${foodList[index]['salary']}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
