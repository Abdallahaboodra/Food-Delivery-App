// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';

// import '../../common/color_extension.dart';
// import '../../common_widget/round_textfield.dart';
// import '../more/my_order_view.dart';
// import 'menu_items_view.dart';

// class MenuView extends StatefulWidget {
//   const MenuView({super.key});

//   @override
//   State<MenuView> createState() => _MenuViewState();
// }

// class _MenuViewState extends State<MenuView> {
//   List menuArr = [
//     {
//       "name": "Food".tr(),
//       "image": "assets/img/menu_1.png",
//       "items_count": "120",
//     },
//     {
//       "name": "Beverages".tr(),
//       "image": "assets/img/menu_2.png",
//       "items_count": "220",
//     },
//     {
//       "name": "Desserts".tr(),
//       "image": "assets/img/menu_3.png",
//       "items_count": "155",
//     },
//     // {
//     //   "name": "Promotions".tr(),
//     //   "image": "assets/img/menu_4.png",
//     //   "items_count": "25",
//     // },
//   ];
//   TextEditingController txtSearch = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.centerLeft,
//         children: [
//           Container(
//             margin: const EdgeInsets.only(top: 180),
//             width: media.width * 0.27,
//             height: media.height * 0.6,
//             decoration: BoxDecoration(
//               color: TColor.primary,
//               borderRadius: const BorderRadius.only(
//                   topRight: Radius.circular(35),
//                   bottomRight: Radius.circular(35)),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 20),
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 46,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Menu".tr(),
//                           style: TextStyle(
//                               color: TColor.primaryText,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w800),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => MyOrderView()));
//                           },
//                           icon: Image.asset(
//                             "assets/img/shopping_cart.png",
//                             width: 25,
//                             height: 25,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: RoundTextfield(
//                       hintText: "Search Food".tr(),
//                       controller: txtSearch,
//                       left: Container(
//                         alignment: Alignment.center,
//                         width: 30,
//                         child: Image.asset(
//                           "assets/img/search.png",
//                           width: 20,
//                           height: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   ListView.builder(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 30, horizontal: 20),
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: menuArr.length,
//                       itemBuilder: ((context, index) {
//                         var mObj = menuArr[index] as Map? ?? {};
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => MenuItemsView(
//                                   mObj: mObj,
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Stack(
//                             alignment: AlignmentDirectional.centerEnd,
//                             children: [
//                               Container(
//                                 margin: const EdgeInsets.only(
//                                     top: 8, bottom: 8, right: 20),
//                                 width: media.width - 100,
//                                 height: 90,
//                                 decoration: const BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(25),
//                                         bottomLeft: Radius.circular(25),
//                                         topRight: Radius.circular(10),
//                                         bottomRight: Radius.circular(10)),
//                                     boxShadow: [
//                                       BoxShadow(
//                                           color: Colors.black12,
//                                           blurRadius: 7,
//                                           offset: Offset(0, 4))
//                                     ]),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Image.asset(
//                                     mObj["image"].toString(),
//                                     width: 80,
//                                     height: 80,
//                                     fit: BoxFit.contain,
//                                   ),
//                                   const SizedBox(
//                                     width: 15,
//                                   ),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           mObj["name".tr()].toString(),
//                                           style: TextStyle(
//                                               color: TColor.primaryText,
//                                               fontSize: 22,
//                                               fontWeight: FontWeight.w700),
//                                         ),
//                                         const SizedBox(
//                                           height: 4,
//                                         ),
//                                         Text(
//                                           "${mObj["items_count"].toString()} items"
//                                               .tr(),
//                                           style: TextStyle(
//                                               color: TColor.secondaryText,
//                                               fontSize: 11),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     width: 35,
//                                     height: 35,
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius:
//                                             BorderRadius.circular(17.5),
//                                         boxShadow: const [
//                                           BoxShadow(
//                                               color: Colors.black12,
//                                               blurRadius: 4,
//                                               offset: Offset(0, 2))
//                                         ]),
//                                     alignment: Alignment.center,
//                                     child: Image.asset(
//                                       "assets/img/btn_next.png",
//                                       width: 15,
//                                       height: 15,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         );
//                       }))
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:food_delivery/view/more/pasket_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_textfield.dart';
import '../more/my_order_view.dart';
import 'menu_items_view.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  List menuArr = [
    {
      "name": "Food".tr(),
      "image": "assets/img/menu_1.png",
      "items_count": "120",
    },
    {
      "name": "Beverages".tr(),
      "image": "assets/img/menu_2.png",
      "items_count": "220",
    },
    {
      "name": "Desserts".tr(),
      "image": "assets/img/menu_3.png",
      "items_count": "155",
    },
  ];
  List<Map<String, dynamic>> foodItemsArr = [
    {
      "image": "assets/img/Butter Chicken.jpg",
      "name": "indian chicken",
      "rate": "5.4",
      "rating": "130",
      "type": 20,
      "food_type": "food"
    },
    {
      "image": "assets/img/Pizza Margherita.jpg",
      "name": "Pizza Margherita",
      "rate": "4.9",
      "rating": "124",
      "type": 30,
      "food_type": "food"
    },
    {
      "image": "assets/img/Rice and Curry.jpg",
      "name": "Rice and Curry",
      "rate": "4.9",
      "rating": "124",
      "type": 40,
      "food_type": "food"
    },
    {
      "image": "assets/img/Rogan Josh.jpg",
      "name": "Rogan Josh",
      "rate": "3.9",
      "rating": "124",
      "type": 45,
      "food_type": "food"
    },
    {
      "image": "assets/img/Samosa.jpg",
      "name": "Samosa",
      "rate": "4.2",
      "rating": "124",
      "type": 20,
      "food_type": "food"
    },
    {
      "image": "assets/img/Risotto.jpg",
      "name": "Risotto",
      "rate": "4.8",
      "rating": "124",
      "type": 60,
      "food_type": "food"
    },
    {
      "image": "assets/img/Spaghetti Carbonara.jpg",
      "name": "Spaghetti Carbonara",
      "rate": "4.6",
      "rating": "124",
      "type": 25,
      "food_type": "food"
    },
    {
      "image": "assets/img/String Hoppers.jpg",
      "name": "String Hoppers",
      "rate": "4.9",
      "rating": "124",
      "type": 60,
      "food_type": "food"
    },
  ]; // قائمة الأطعمة
  List beverageItemsArr = [
    {
      "image": "assets/img/irish coffee.jpg",
      "name": "irish coffee",
      "rate": "4.9",
      "rating": "124",
      "type": 15,
      "food_type": "beverage"
    },
    {
      "image": "assets/img/cocktail corner.jpg",
      "name": "cocktail corner",
      "rate": "4.3",
      "rating": "124",
      "type": 65,
      "food_type": "beverage"
    },
    {
      "image": "assets/img/fresh and fruite strawberry.jpg",
      "name": "fresh and fruite strawberry",
      "rate": "5.1",
      "rating": "124",
      "type": 45,
      "food_type": "beverage"
    },
    {
      "image": "assets/img/healthy protein smoothie.jpg",
      "name": "healthy protein smoothie",
      "rate": "2.9",
      "rating": "124",
      "type": 70,
      "food_type": "beverage"
    },
    {
      "image": "assets/img/mixed berry smoothie.jpg",
      "name": "mixed berry smoothie",
      "rate": "4",
      "rating": "124",
      "type": 30,
      "food_type": "beverage"
    },
    {
      "image": "assets/img/fresh and fruite strawberry.jpg",
      "name": "fresh and fruite strawberry",
      "rate": "5.9",
      "rating": "124",
      "type": 40,
      "food_type": "beverage"
    },
    {
      "image": "assets/img/coffee.jpg",
      "name": "french coffee",
      "rate": "3.9",
      "rating": "124",
      "type": 35,
      "food_type": "beverage"
    },
    {
      "image": "assets/img/turhish coffee.jpg",
      "name": "turhish coffee",
      "rate": "4.1",
      "rating": "124",
      "type": 25,
      "food_type": "beverage"
    },
  ]; // قائمة المشروبات
  List dessertItemsArr = [
    {
      "image": "assets/img/dess_1.png",
      "name": "French Apple Pie",
      "rate": "4.9",
      "rating": "124",
      "type": 30,
      "food_type": "Desserts"
    },
    {
      "image": "assets/img/dess_2.png",
      "name": "Dark Chocolate Cake",
      "rate": "4.9",
      "rating": "124",
      "type": 33,
      "food_type": "Desserts"
    },
    {
      "image": "assets/img/dess_3.png",
      "name": "Street Shake",
      "rate": "4.9",
      "rating": "124",
      "type": 24,
      "food_type": "Desserts"
    },
    {
      "image": "assets/img/dess_4.png",
      "name": "Fudgy Chewy Brownies",
      "rate": "4.9",
      "rating": "124",
      "type": 42,
      "food_type": "Desserts"
    },
    {
      "image": "assets/img/dess_1.png",
      "name": "French Apple Pie",
      "rate": "4.9",
      "rating": "124",
      "type": 65,
      "food_type": "Desserts"
    },
    {
      "image": "assets/img/dess_2.png",
      "name": "Dark Chocolate Cake",
      "rate": "4.9",
      "rating": "124",
      "type": 20,
      "food_type": "Desserts"
    },
    {
      "image": "assets/img/dess_3.png",
      "name": "Street Shake",
      "rate": "4.9",
      "rating": "124",
      "type": 50,
      "food_type": "Desserts"
    },
    {
      "image": "assets/img/dess_4.png",
      "name": "Fudgy Chewy Brownies",
      "rate": "4.9",
      "rating": "124",
      "type": 52,
      "food_type": "Desserts"
    },
  ]; // قائمة الحلويات

  TextEditingController txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 180),
            width: media.width * 0.27,
            height: media.height * 0.6,
            decoration: BoxDecoration(
              color: TColor.primary,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 46,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Menu".tr(),
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyOrderDetailsPage(),
                              ),
                            );
                          },
                          icon: Image.asset(
                            "assets/img/shopping_cart.png",
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RoundTextfield(
                      hintText: "Search Food".tr(),
                      controller: txtSearch,
                      left: Container(
                        alignment: Alignment.center,
                        width: 30,
                        child: Image.asset(
                          "assets/img/search.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: menuArr.length,
                    itemBuilder: ((context, index) {
                      var mObj = menuArr[index] as Map? ?? {};
                      return GestureDetector(
                        onTap: () {
                          String itemType = mObj["name"].toString();
                          late List selectedItemsArr;
                          if (itemType == "Food".tr()) {
                            selectedItemsArr = foodItemsArr;
                          } else if (itemType == "Beverages".tr()) {
                            selectedItemsArr = beverageItemsArr;
                          } else if (itemType == "Desserts".tr()) {
                            selectedItemsArr = dessertItemsArr;
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MenuItemsView(
                                mObj: mObj,
                                itemsArr: selectedItemsArr,
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 8, bottom: 8, right: 20),
                              width: media.width - 100,
                              height: 90,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 7,
                                    offset: Offset(0, 4),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  mObj["image"].toString(),
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        mObj["name"].toString(),
                                        style: TextStyle(
                                          color: TColor.primaryText,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "${mObj["items_count"].toString()} items",
                                        style: TextStyle(
                                          color: TColor.secondaryText,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(17.5),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                  ),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "assets/img/btn_next.png",
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
