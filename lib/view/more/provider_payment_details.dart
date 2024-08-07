import 'package:flutter/material.dart';

class CardDataProvider extends ChangeNotifier {
  // CardData _cardData = CardData();

  // CardData get cardData => _cardData;
  List<CardData> _addCardData = [];

  List<CardData> get addCardData => _addCardData;

  void updateCardData(CardData addCardData) {
    _addCardData.add(addCardData);
    notifyListeners();
  }

  void removeCardData(CardData addCardData) {
    _addCardData.remove(addCardData);
    notifyListeners();
  }
}

class CardData {
  String cardNumber;
  String cardMonth;
  String cardYear;
  String cardCode;
  String firstName;
  String lastName;
  bool isAnyTime;

  CardData({
    this.cardNumber = '',
    this.cardMonth = '',
    this.cardYear = '',
    this.cardCode = '',
    this.firstName = '',
    this.lastName = '',
    this.isAnyTime = false,
  });
}
