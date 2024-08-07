import 'package:flutter/material.dart';

class MyOrderDataProvider extends ChangeNotifier {
  // CardData _cardData = CardData();

  // CardData get cardData => _cardData;
  List<MyOrderData> _addOrderData = [];

  List<MyOrderData> get addOrderData => _addOrderData;

  void updateCardData(MyOrderData addOrderData) {
    _addOrderData.add(addOrderData);
    notifyListeners();
  }

  void removeCardData(MyOrderData addCardData) {
    _addOrderData.remove(addCardData);
    notifyListeners();
  }
}

class MyOrderData {
  double total;
  final String image;
  final String NameOrder;
  final String? location;

  MyOrderData(
      {this.total = 0,
      this.image = 'assets/img/shop_logo.png',
      this.NameOrder = 'food',
      this.location});
}
