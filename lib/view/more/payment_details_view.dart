import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common_widget/round_icon_button.dart';
import 'package:food_delivery/view/more/add_card_view.dart';
import 'package:food_delivery/view/more/provider_payment_details.dart';
import 'package:provider/provider.dart';

import '../../common_widget/round_button.dart';
import 'my_order_view.dart';

class PaymentDetailsView extends StatefulWidget {
  const PaymentDetailsView({super.key});

  @override
  State<PaymentDetailsView> createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends State<PaymentDetailsView> {
  List cardArr = [
    {
      "icon": "visa",
      "card": "**** **** **** 2187",
    }
  ];
//   void removeCard(int index) {
//     final CardDataProvider dataProvider =
//         Provider.of<CardDataProvider>(context, listen: false);
//    if (value.addCardData.isNotEmpty) {
//   // قائمة البطاقات غير فارغة، لذا يمكننا استخدام index بشكل آمن
//    final CardDataProvider dataProvider =
//         Provider.of<CardDataProvider>(context, listen: false);
//   dataProvider.removeCardData(dataProvider.addCardData[index]);
// }

//   }

  @override
  Widget build(BuildContext context) {
    return Consumer<CardDataProvider>(
      builder: (context, value, child) => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 46,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset("assets/img/btn_back.png",
                            width: 20, height: 20),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          "Payment Details".tr(),
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyOrderView(
                                          NameOrder: '',
                                          image: '',
                                        )));
                          },
                          icon: Image.asset(
                            "assets/img/shopping_cart.png",
                            width: 25,
                            height: 25,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  child: Text(
                    "Customize your payment method".tr(),
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    color: TColor.secondaryText.withOpacity(0.4),
                    height: 1,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: TColor.textfield,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 15,
                            offset: Offset(0, 9))
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Cash/Card On Delivery".tr(),
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                            Image.asset(
                              "assets/img/check.png",
                              width: 20,
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Divider(
                          color: TColor.secondaryText.withOpacity(0.4),
                          height: 1,
                        ),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: cardArr.length,
                        itemBuilder: ((context, index) {
                          var cObj = cardArr[index] as Map? ?? {};
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 35),
                            child: Row(
                              children: [
                                value.addCardData.isEmpty
                                    ? Text(
                                        cObj["icon"].toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : Text(
                                        value.addCardData[index].lastName,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: value.addCardData.isEmpty
                                      ? Text(
                                          cObj["card".tr()].toString(),
                                          style: TextStyle(
                                              color: TColor.secondaryText,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        )
                                      : Text(
                                          value.addCardData[index].cardNumber),
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 28,
                                  child: RoundButton(
                                    title: 'Delete Card'.tr(),
                                    fontSize: 12,
                                    onPressed: () {
                                      if (value.addCardData.isNotEmpty) {
                                        // قائمة البطاقات غير فارغة، لذا يمكننا استخدام index بشكل آمن
                                        final CardDataProvider dataProvider =
                                            Provider.of<CardDataProvider>(
                                                context,
                                                listen: false);
                                        dataProvider.removeCardData(
                                            dataProvider.addCardData[index]);
                                      } // Call removeCard function with index
                                    },
                                    type: RoundButtonType.textPrimary,
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Divider(
                          color: TColor.secondaryText.withOpacity(0.4),
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Other Methods".tr(),
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: RoundIconButton(
                      title: "Add Another Credit/Debit Card".tr(),
                      icon: "assets/img/add.png",
                      color: TColor.primary,
                      fontSize: 16,
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return const AddCardView();
                            });
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const AddCardView() ));
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
