import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../menu/item_details_view.dart';

class SriLankanFoodView extends StatelessWidget {
  final List<Map<String, dynamic>> foodList = [
    {
      "name": "Rice and Curry",
      "salary": 20,
      "image": "assets/img/Rice and Curry.jpg",
    },
    {
      "name": "Kottu Roti",
      "salary": 25,
      "image": "assets/img/Kottu Roti.jpg",
    },
    {
      "name": "Hoppers (Appam)",
      "salary": 45,
      "image": "assets/img/String Hoppers.jpg",
    },
    {
      "name": "String Hoppers (Idiyappam)",
      "salary": 55,
      "image": "assets/img/Hoppers (Appam).jpg",
    },
    {
      "name": "Sri Lankan Fish Curry",
      "salary": 65,
      "image": "assets/img/Fish Curry.jpg",
    },
    // Add more Sri Lankan food items here
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
