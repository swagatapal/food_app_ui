import 'package:flutter/material.dart';
import 'package:food_delivery_ui/screen/Home_page.dart';
import 'package:provider/provider.dart';

import 'model/food_provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => FoodProvider(),
    child: const MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: Container(color:Colors.white)
      home: FoodListPage(),
    );
  }
}
