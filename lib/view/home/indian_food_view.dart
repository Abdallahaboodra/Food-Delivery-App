import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/view/menu/item_details_view.dart';

class IndianFoodView extends StatelessWidget {
  final List<Map<String, dynamic>> foodList = [
    {
      "name": "Biryani",
      "salary": 65,
      "image": "assets/img/Biryani.jpg",
    },
    {
      "name": "Butter Chicken",
      "salary": 45,
      "image": "assets/img/Butter Chicken.jpg",
    },
    {
      "name": "Paneer Tikka",
      "salary": 50,
      "image": "assets/img/Paneer Tikka.jpg",
    },
    {
      "name": "Samosa",
      "salary": 100,
      "image": "assets/img/Samosa.jpg",
    },
    {
      "name": "Masala Dosa",
      "salary": 90,
      "image": "assets/img/Masala Dosa.jpg",
    },
    {
      "name": "Chole Bhature",
      "salary": 75,
      "image": "assets/img/Chole Bhature.jpg",
    },
    {
      "name": "Rogan Josh",
      "salary": 86,
      "image": "assets/img/Rogan Josh.jpg",
    },
    {
      "name": "Pani Puri",
      "salary": 110,
      "image": "assets/img/Pani Puri.jpg",
    },
    // Add more food items here
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
