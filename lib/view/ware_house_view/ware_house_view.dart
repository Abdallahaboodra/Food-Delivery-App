// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:food_delivery/common/color_extension.dart';
// import 'package:food_delivery/common_widget/round_button.dart';
// import 'package:food_delivery/view/main_tabview/main_tabview.dart';
// import 'package:food_delivery/view/menu/item_details_view.dart';

// class GasRepository {
//   final String name;
//   final String location;
//   final String details;
//   final String phoneNumber;
//   final String imagePath;
//   final double gasCylinderChangePrice; // Price for changing gas cylinder
//   final double gasCylinderPurchasePrice;
//   GasRepository({
//     required this.name,
//     required this.location,
//     required this.details,
//     required this.phoneNumber,
//     required this.imagePath,
//     required this.gasCylinderChangePrice,
//     required this.gasCylinderPurchasePrice,
//   });
// }

// class WelcomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<String> imagePaths = [
//       'assets/img/th (2).jpg',
//       'assets/img/cat_4.png',
//       'assets/img/cat_sri.png',
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         backgroundColor: TColor.primary,
//         title: const Text(
//           'Welcome',
//           style: TextStyle(color: Colors.white),
//         ).tr(),
//       ),
//       body: Column(
//         children: [
//           CarouselSlider(
//             options: CarouselOptions(
//               height: 200.0,
//               aspectRatio: 16 / 9,
//               viewportFraction: 1.0,
//               autoPlay: true,
//               autoPlayInterval: const Duration(seconds: 3),
//               autoPlayAnimationDuration: const Duration(milliseconds: 800),
//               autoPlayCurve: Curves.fastOutSlowIn,
//               pauseAutoPlayOnTouch: true,
//               enlargeCenterPage: true,
//             ),
//             items: imagePaths.map((String imagePath) {
//               return Builder(
//                 builder: (BuildContext context) {
//                   return Container(
//                     width: MediaQuery.of(context).size.width / 1.2,
//                     margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                     decoration: const BoxDecoration(
//                       color: Colors.grey,
//                     ),
//                     child: Image.asset(
//                       imagePath,
//                       fit: BoxFit.cover,
//                     ),
//                   );
//                 },
//               );
//             }).toList(),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(height: 100),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: TColor.primary,
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => MainTabView(),
//                     ),
//                   );
//                 },
//                 child: const Text(
//                   'View Restaurants and Meals',
//                   style: TextStyle(color: Colors.white),
//                 ).tr(),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: TColor.primary,
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => GasRepositoriesPage(),
//                     ),
//                   );
//                 },
//                 child: const Text(
//                   'Change / Purchase Gas Cylinder',
//                   style: TextStyle(color: Colors.white),
//                 ).tr(),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// class GasRepositoriesPage extends StatelessWidget {
//   final List<GasRepository> gasRepositories = [
//     GasRepository(
//       name: 'Gas Station 1'.tr(),
//       location: '123 King Fahd Street, Riyadh'.tr(),
//       details:
//           'Gas Station 1 is located in the heart of Riyadh, the capital city.'
//               .tr(),
//       phoneNumber: '+966-123-456-789'.tr(),
//       imagePath: 'assets/img/OIP.jpg'.tr(),
//       gasCylinderChangePrice: 20.0,
//       gasCylinderPurchasePrice: 100.0,
//     ),
//     GasRepository(
//       name: 'Gas Station 2'.tr(),
//       location: 'King Abdullah Road, Jeddah'.tr(),
//       details:
//           'Gas Station 2 is located near King Abdullah Road in Jeddah city.'
//               .tr(), // هنا نضيف .tr()
//       phoneNumber: '+966-234-567-890',
//       imagePath: 'assets/img/OIP (1).jpg',
//       gasCylinderChangePrice: 15.0, // Add price for changing gas cylinder
//       gasCylinderPurchasePrice: 120.0,
//     ),
//     GasRepository(
//       name: 'Gas Station 3'.tr(), // هنا نضيف .tr()
//       location: 'King Fahd Street, Dammam'.tr(), // هنا نضيف .tr()
//       details:
//           'Gas Station 3 is located in the Dammam area in the Eastern Province.'
//               .tr(), // هنا نضيف .tr()
//       phoneNumber: '+966-345-678-901',
//       imagePath: 'assets/img/th (1).jpg',
//       gasCylinderChangePrice: 30.0, // Add price for changing gas cylinder
//       gasCylinderPurchasePrice: 150.0,
//     ),
//     GasRepository(
//       name: 'Gas Station 4'.tr(), // هنا نضيف .tr()
//       location: 'King Abdulaziz Road, Madinah'.tr(), // هنا نضيف .tr()
//       details:
//           'Gas Station 4 is located on King Abdulaziz Road in Madinah city.'
//               .tr(), // هنا نضيف .tr()
//       phoneNumber: '+966-456-789-012',
//       imagePath: 'assets/img/th (2).jpg',
//       gasCylinderChangePrice: 17.0, // Add price for changing gas cylinder
//       gasCylinderPurchasePrice: 110.0,
//     ),
//     GasRepository(
//       name: 'Gas Station 5'.tr(), // هنا نضيف .tr()
//       location: 'King Fahd Road, Dhahran'.tr(), // هنا نضيف .tr()
//       details: 'Gas Station 5 is located near King Fahd Road in Dhahran city.'
//           .tr(), // هنا نضيف .tr()
//       phoneNumber: '+966-567-890-123',
//       imagePath: 'assets/img/th.jpg',
//       gasCylinderChangePrice: 27.0, // Add price for changing gas cylinder
//       gasCylinderPurchasePrice: 119.0,
//     ),
//     GasRepository(
//       name: 'Gas Station 6'.tr(), // هنا نضيف .tr()
//       location: 'King Abdulaziz Road, Taif'.tr(), // هنا نضيف .tr()
//       details: 'Gas Station 6 is located on King Abdulaziz Road in Taif city.'
//           .tr(), // هنا نضيف .tr()
//       phoneNumber: '+966-678-901-234',
//       imagePath: 'assets/img/download.jpg',
//       gasCylinderChangePrice: 35.0, // Add price for changing gas cylinder
//       gasCylinderPurchasePrice: 135.0,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         backgroundColor: TColor.primary,
//         title: const Text(
//           'Gas Repositories',
//           style: TextStyle(color: Colors.white),
//         ).tr(),
//       ),
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, // عدد العناصر الأفقية في كل صف
//           crossAxisSpacing: 10.0, // المسافة الأفقية بين العناصر
//           mainAxisSpacing: 10.0, // المسافة الرأسية بين العناصر
//         ),
//         itemCount: gasRepositories.length,
//         itemBuilder: (BuildContext context, int index) {
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => GasRepositoryDetailsPage(
//                     gasRepository: gasRepositories[index],
//                   ),
//                 ),
//               );
//             },
//             child: Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Image.asset(
//                       gasRepositories[index].imagePath,
//                       width: MediaQuery.of(context).size.width,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           gasRepositories[index].name,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           ' ${'Location'.tr()}: ${gasRepositories[index].location}',
//                           style: const TextStyle(fontSize: 14),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class GasRepositoryDetailsPage extends StatelessWidget {
//   final GasRepository gasRepository;

//   const GasRepositoryDetailsPage({required this.gasRepository});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         backgroundColor: TColor.primary,
//         title: const Text(
//           'Gas Repository Details',
//           style: TextStyle(color: Colors.white),
//         ).tr(),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(
//               gasRepository.imagePath,
//               width: MediaQuery.of(context).size.width,
//               height: 200,
//               fit: BoxFit.fill,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Card(
//                 child: Column(
//                   children: [
//                     ListTile(
//                       leading: const Icon(Icons.business),
//                       title: Text(
//                         gasRepository.name.tr(),
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     ListTile(
//                       leading: const Icon(Icons.location_on),
//                       title: Text(
//                         'Location'.tr(),
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ).tr(),
//                       subtitle: Text(
//                         gasRepository.location.tr(),
//                         style: const TextStyle(fontSize: 18),
//                       ),
//                     ),
//                     ListTile(
//                       leading: const Icon(Icons.info),
//                       title: Text(
//                         'Details'.tr(),
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       subtitle: Text(
//                         gasRepository.details.tr(),
//                         style: const TextStyle(fontSize: 18),
//                       ),
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.attach_money),
//                       title: Text(
//                         'Gas Cylinder Change Price'.tr(),
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       subtitle: Text(
//                         '${gasRepository.gasCylinderChangePrice} SAR'.tr(),
//                         style: const TextStyle(fontSize: 18),
//                       ),
//                     ),
//                     // ListTile(
//                     //   leading: const Icon(Icons.attach_money),
//                     //   title: const Text(
//                     //     'Gas Cylinder Purchase Price',
//                     //     style: TextStyle(
//                     //       fontSize: 18,
//                     //       fontWeight: FontWeight.bold,
//                     //     ),
//                     //   ),
//                     //   subtitle: Text(
//                     //     '${gasRepository.gasCylinderPurchasePrice} SAR',
//                     //     style: const TextStyle(fontSize: 18),
//                     //   ),
//                     // ),
//                     ListTile(
//                       leading: const Icon(Icons.phone),
//                       title: Text(
//                         'Phone Number'.tr(),
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       subtitle: Text(
//                         gasRepository.phoneNumber,
//                         style: const TextStyle(fontSize: 18),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             RoundButton(
//                 title: "Add To Cart".tr(),
//                 onPressed: () async {
//                   // saveProfile();
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => ItemDetailsView(
//                                 foodSalary:
//                                     '${gasRepository.gasCylinderChangePrice} SAR'
//                                         .tr(),
//                                 foodName: gasRepository.name.tr(),
//                                 foodImage: gasRepository.imagePath,
//                                 details: gasRepository.details.tr(),
//                                 location: gasRepository.location.tr(),
//                               )));
//                 }),
//             SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// // import 'package:easy_localization/easy_localization.dart';
// // import 'package:flutter/material.dart';
// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:food_delivery/common/color_extension.dart';
// // import 'package:food_delivery/common_widget/round_button.dart';
// // import 'package:food_delivery/view/main_tabview/main_tabview.dart';
// // import 'package:food_delivery/view/menu/item_details_view.dart';

// // class GasRepository {
// //   final String name;
// //   final String location;
// //   final String details;
// //   final String phoneNumber;
// //   final String imagePath;
// //   final double gasCylinderChangePrice; // Price for changing gas cylinder
// //   final double gasCylinderPurchasePrice;
// //   GasRepository({
// //     required this.name,
// //     required this.location,
// //     required this.details,
// //     required this.phoneNumber,
// //     required this.imagePath,
// //     required this.gasCylinderChangePrice,
// //     required this.gasCylinderPurchasePrice,
// //   });
// // }

// // class WelcomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     List<String> imagePaths = [
// //       'assets/img/th (2).jpg',
// //       'assets/img/cat_4.png',
// //       'assets/img/cat_sri.png',
// //     ];

// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: TColor.primary,
// //         title: Text('Welcome'.tr()), // هنا نضيف .tr()
// //       ),
// //       body: Column(
// //         children: [
// //           CarouselSlider(
// //             options: CarouselOptions(
// //               height: 200.0,
// //               aspectRatio: 16 / 9,
// //               viewportFraction: 1.0,
// //               autoPlay: true,
// //               autoPlayInterval: const Duration(seconds: 3),
// //               autoPlayAnimationDuration: const Duration(milliseconds: 800),
// //               autoPlayCurve: Curves.fastOutSlowIn,
// //               pauseAutoPlayOnTouch: true,
// //               enlargeCenterPage: true,
// //             ),
// //             items: imagePaths.map((String imagePath) {
// //               return Builder(
// //                 builder: (BuildContext context) {
// //                   return Container(
// //                     width: MediaQuery.of(context).size.width / 1.2,
// //                     margin: const EdgeInsets.symmetric(horizontal: 5.0),
// //                     decoration: const BoxDecoration(
// //                       color: Colors.grey,
// //                     ),
// //                     child: Image.asset(
// //                       imagePath,
// //                       fit: BoxFit.cover,
// //                     ),
// //                   );
// //                 },
// //               );
// //             }).toList(),
// //           ),
// //           Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               const SizedBox(height: 100),
// //               ElevatedButton(
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: TColor.primary,
// //                 ),
// //                 onPressed: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => MainTabView(),
// //                     ),
// //                   );
// //                 },
// //                 child: Text(
// //                   'View Restaurants and Meals'.tr(), // هنا نضيف .tr()
// //                   style: TextStyle(color: Colors.white),
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //               ElevatedButton(
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: TColor.primary,
// //                 ),
// //                 onPressed: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => GasRepositoriesPage(),
// //                     ),
// //                   );
// //                 },
// //                 child: Text(
// //                   'Change / Purchase Gas Cylinder'.tr(), // هنا نضيف .tr()
// //                   style: TextStyle(color: Colors.white),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class GasRepositoriesPage extends StatelessWidget {
// //   final List<GasRepository> gasRepositories = [
// //     GasRepository(
// //       name: 'Gas Station 1',
// //       location: '123 King Fahd Street, Riyadh',
// //       details:
// //           'Gas Station 1 is located in the heart of Riyadh, the capital city.',
// //       phoneNumber: '+966-123-456-789',
// //       imagePath: 'assets/img/OIP.jpg',
// //       gasCylinderChangePrice: 20.0, // Add price for changing gas cylinder
// //       gasCylinderPurchasePrice: 100.0,
// //     ),
// //     // البيانات الأخرى لمحطات الغاز هنا
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: TColor.primary,
// //         title: Text('Gas Repositories'.tr()), // هنا نضيف .tr()
// //       ),
// //       body: GridView.builder(
// //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //           crossAxisCount: 2, // عدد العناصر الأفقية في كل صف
// //           crossAxisSpacing: 10.0, // المسافة الأفقية بين العناصر
// //           mainAxisSpacing: 10.0, // المسافة الرأسية بين العناصر
// //         ),
// //         itemCount: gasRepositories.length,
// //         itemBuilder: (BuildContext context, int index) {
// //           return GestureDetector(
// //             onTap: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(
// //                   builder: (context) => GasRepositoryDetailsPage(
// //                     gasRepository: gasRepositories[index],
// //                   ),
// //                 ),
// //               );
// //             },
// //             child: Card(
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Expanded(
// //                     child: Image.asset(
// //                       gasRepositories[index].imagePath,
// //                       width: MediaQuery.of(context).size.width,
// //                       fit: BoxFit.fill,
// //                     ),
// //                   ),
// //                   Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text(
// //                           gasRepositories[index].name,
// //                           style: const TextStyle(
// //                             fontSize: 18,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                         const SizedBox(height: 4),
// //                         Text(
// //                           'Location: ${gasRepositories[index].location}',
// //                           style: const TextStyle(fontSize: 14),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// // class GasRepositoryDetailsPage extends StatelessWidget {
// //   final GasRepository gasRepository;

// //   const GasRepositoryDetailsPage({required this.gasRepository});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: TColor.primary,
// //         title: Text('Gas Repository Details'.tr()), // هنا نضيف .tr()
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Image.asset(
// //               gasRepository.imagePath,
// //               width: MediaQuery.of(context).size.width,
// //               height: 200,
// //               fit: BoxFit.fill,
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: Card(
// //                 child: Column(
// //                   children: [
// //                     ListTile(
// //                       leading: const Icon(Icons.business),
// //                       title: Text(
// //                         gasRepository.name,
// //                         style: const TextStyle(
// //                           fontSize: 24,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                     ),
// //                     ListTile(
// //                       leading: const Icon(Icons.location_on),
// //                       title: const Text(
// //                         'Location',
// //                         style: TextStyle(
// //                           fontSize: 18,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       subtitle: Text(
// //                         gasRepository.location,
// //                         style: const TextStyle(fontSize: 18),
// //                       ),
// //                     ),
// //                     ListTile(
// //                       leading: const Icon(Icons.info),
// //                       title: Text(
// //                         'Details'.tr(),
// //                         style: TextStyle(
// //                           fontSize: 18,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       subtitle: Text(
// //                         gasRepository.details,
// //                         style: const TextStyle(fontSize: 18),
// //                       ),
// //                     ),
// //                     ListTile(
// //                       leading: Icon(Icons.attach_money),
// //                       title: Text(
// //                         'Gas Cylinder Change Price'.tr(),
// //                         style: TextStyle(
// //                           fontSize: 18,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       subtitle: Text(
// //                         '${gasRepository.gasCylinderChangePrice} SAR',
// //                         style: const TextStyle(fontSize: 18),
// //                       ),
// //                     ),
// //                     // ListTile(
// //                     //   leading: const Icon(Icons.attach_money),
// //                     //   title: const Text(
// //                     //     'Gas Cylinder Purchase Price',
// //                     //     style: TextStyle(
// //                     //       fontSize: 18,
// //                     //       fontWeight: FontWeight.bold,
// //                     //     ),
// //                     //   ),
// //                     //   subtitle: Text(
// //                     //     '${gasRepository.gasCylinderPurchasePrice} SAR',
// //                     //     style: const TextStyle(fontSize: 18),
// //                     //   ),
// //                     // ),
// //                     ListTile(
// //                       leading: const Icon(Icons.phone),
// //                       title: const Text(
// //                         'Phone Number',
// //                         style: TextStyle(
// //                           fontSize: 18,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       subtitle: Text(
// //                         gasRepository.phoneNumber,
// //                         style: const TextStyle(fontSize: 18),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             SizedBox(
// //               height: 20,
// //             ),
// //             RoundButton(
// //                 title: "Add To Cart".tr(),
// //                 onPressed: () async {
// //                   // saveProfile();
// //                   Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                           builder: (context) => ItemDetailsView(
// //                                 foodSalary:
// //                                     '${gasRepository.gasCylinderChangePrice} SAR',
// //                                 foodName: gasRepository.name,
// //                                 foodImage: gasRepository.imagePath,
// //                                 details: gasRepository.details,
// //                                 location: gasRepository.location,
// //                               )));
// //                 }),
// //             SizedBox(
// //               height: 20,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // void main() {
// // //   runApp(
// // //     EasyLocalization(
// // //       supportedLocales: [
// // //         Locale('en', 'US'),
// // //         Locale('ar', 'SA')
// // //       ], // اللغات المعتمدة
// // //       path: 'assets/translations', // مسار ملفات الترجمة
// // //       fallbackLocale:
// // //           Locale('en', 'US'), // اللغة الافتراضية في حال عدم العثور على الترجمة
// // //       child: MyApp(),
// // //     ),
// // //   );
// // // }

// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Flutter Demo',
// // //       localizationsDelegates: context.localizationDelegates,
// // //       supportedLocales: context.supportedLocales,
// // //       locale: context.locale,
// // //       theme: ThemeData(
// // //         primarySwatch: Colors.blue,
// // //       ),
// // //       home: WelcomePage(),
// // //     );
// // //   }
// // // }
