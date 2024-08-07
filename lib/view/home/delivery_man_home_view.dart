import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'delivery_man_order_view.dart';

class DeliveryManHomeView extends StatelessWidget {
  const DeliveryManHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery man').tr(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/img/on_boarding_2.png', // استبدل بمسار الصورة الخاصة بك
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome, Delivery Man'.tr(), // النص الترحيبي لسائق التوصيل
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DeliveryManOrderView()),
                );
              },
              child: Text('Show Orders'.tr()),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Text('This is the Second Screen'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DeliveryManHomeView(),
  ));
}
