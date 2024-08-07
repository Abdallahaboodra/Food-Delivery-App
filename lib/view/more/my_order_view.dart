import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common_widget/round_button.dart';
import 'package:food_delivery/view/more/my_order_provider.dart';
import 'package:food_delivery/view/more/provider_payment_details.dart';
import 'package:provider/provider.dart';

import 'checkout_view.dart';

class MyOrderView extends StatefulWidget {
  MyOrderView(
      {this.total = 0,
      this.image = 'assets/img/shop_logo.png',
      this.NameOrder = 'food',
      this.location});
  double total;
  final String image;
  final String NameOrder;
  final String? location;
  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  List itemArr = [
    {"name": "Beef Burger", "qty": "1", "price": ""},
    {"name": "Classic Burger", "qty": "1", "price": ""},
    {"name": "Cheese Chicken Burger", "qty": "1", "price": ""},
    {"name": "Chicken Legs Basket", "qty": "1", "price": ""},
    {"name": "French Fires Large", "qty": "1", "price": ""}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
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
                        "My Order".tr(),
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          widget.image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.NameOrder.tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/img/rate.png",
                                width: 10,
                                height: 10,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "4.9",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: TColor.primary, fontSize: 12),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "(124 Ratings)".tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: TColor.secondaryText, fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //     Text(
                              //       "Burger".tr(),
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(
                              //           color: TColor.secondaryText, fontSize: 12),
                              //     ),
                              //     Text(
                              //       " . ",
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(
                              //           color: TColor.primary, fontSize: 12),
                              //     ),
                              //     Text(
                              //       "Western Food".tr(),
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(
                              //           color: TColor.secondaryText, fontSize: 12),
                              //     ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/img/location-pin.png",
                                width: 13,
                                height: 13,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  "${widget.location}",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: TColor.secondaryText,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Container(
              //   decoration: BoxDecoration(color: TColor.textfield),
              //   child: ListView.separated(
              //     physics: const NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     padding: EdgeInsets.zero,
              //     itemCount: itemArr.length,
              //     separatorBuilder: ((context, index) => Divider(
              //           indent: 25,
              //           endIndent: 25,
              //           color: TColor.secondaryText.withOpacity(0.5),
              //           height: 1,
              //         )),
              //     itemBuilder: ((context, index) {
              //       var cObj = itemArr[index] as Map? ?? {};
              //       return Container(
              //         padding: const EdgeInsets.symmetric(
              //             vertical: 15, horizontal: 25),
              //         child: Row(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Expanded(
              //               child: Text(
              //                 "${cObj["name".tr()].toString()} x${cObj["qty".tr()].toString()}",
              //                 style: TextStyle(
              //                     color: TColor.primaryText,
              //                     fontSize: 13,
              //                     fontWeight: FontWeight.w500),
              //               ),
              //             ),
              //             const SizedBox(
              //               width: 15,
              //             ),
              //             Text(
              //               "\$${cObj["price".tr()].toString()}",
              //               style: TextStyle(
              //                   color: TColor.primaryText,
              //                   fontSize: 13,
              //                   fontWeight: FontWeight.w700),
              //             )
              //           ],
              //         ),
              //       );
              //     }),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Instructions".tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        // TextButton.icon(
                        //   onPressed: () {},
                        //   icon: Icon(Icons.add, color: TColor.primary),
                        //   label: Text(
                        //     "Add Notes".tr(),
                        //     style: TextStyle(
                        //         color: TColor.primary,
                        //         fontSize: 13,
                        //         fontWeight: FontWeight.w500),
                        //   ),
                        // )
                      ],
                    ),
                    Divider(
                      color: TColor.secondaryText.withOpacity(0.5),
                      height: 1,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub Total".tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "\SAR ${widget.total}",
                          style: TextStyle(
                              color: TColor.primary,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Cost".tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "\SAR 2.0",
                          style: TextStyle(
                              color: TColor.primary,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: TColor.secondaryText.withOpacity(0.5),
                      height: 1,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total".tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "\SAR ${widget.total + 2}",
                          style: TextStyle(
                              color: TColor.primary,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    RoundButton(
                        title: "Checkout".tr(),
                        onPressed: () {
                          final MyOrderDataProvider dataProvider =
                              Provider.of<MyOrderDataProvider>(context,
                                  listen: false);
                          MyOrderData myOrdreData = MyOrderData(
                            NameOrder: widget.NameOrder,
                            image: widget.image,
                            location: widget.location,
                            total: widget.total,
                          );
                          dataProvider.updateCardData(myOrdreData);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckoutView(
                                  total: widget.total!,
                                ),
                              ));
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: _showItemSelectionDialog,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: TColor.primary // لون الزر
                            ),
                        child: Text(
                          "Add Item",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> availableItems = [
    {"name": "Water", "price": 1.0, "image": "assets/img/water.jpg"},
    {"name": "Coffee", "price": 2.5, "image": "assets/img/coffee.jpg"},
    {"name": "Tea", "price": 1.5, "image": "assets/img/tea.jpg"},
    {"name": "Juice", "price": 2.0, "image": "assets/img/cocktail corner.jpg"},
    {"name": "Soda", "price": 1.8, "image": "assets/img/soda.jpg"},
    {"name": "Salad", "price": 3.0, "image": "assets/img/salad.jpg"},
    {
      "name": "French Fries",
      "price": 2.5,
      "image": "assets/img/french_fries.jpg"
    },
    // يمكنك إضافة المزيد من العناصر هنا
  ];

  void _showItemSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select an item"),
          content: SingleChildScrollView(
            child: Column(
              children: List.generate(
                availableItems.length,
                (index) {
                  // return ListTile(
                  //   title: Text(availableItems[index]["name"]),
                  //   subtitle: Text("\SAR ${availableItems[index]["price"]}"),
                  //   onTap: () {
                  //     setState(() {
                  //       itemArr.add({
                  //         "name": availableItems[index]["name"],
                  //         "qty": "1",
                  //         "price": availableItems[index]["price"]
                  //       });
                  //       // تحديث السعر الإجمالي عند إضافة عنصر جديد
                  //       widget.total += availableItems[index]["price"];
                  //       // قم بإغلاق الحوار بعد اختيار العنصر
                  //       Navigator.pop(context);
                  //     });
                  //   },
                  // );
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(availableItems[index]
                          ["image"]), // تحديث: إضافة الصورة هنا
                    ),
                    title: Text(availableItems[index]["name"]),
                    subtitle: Text("\SAR ${availableItems[index]["price"]}"),
                    onTap: () {
                      setState(() {
                        itemArr.add({
                          "name": availableItems[index]["name"],
                          "qty": "1",
                          "price": availableItems[index]["price"]
                        });
                        widget.total += availableItems[index]["price"];
                        Navigator.pop(context);
                      });
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
