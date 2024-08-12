import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "package:provider_pracrical/controllers/product_controller.dart";
import "package:provider_pracrical/controllers/wishlist_controller.dart";
import "package:provider_pracrical/view/get_product_details.dart";

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ 
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return ProductController(); 
          },
        ),
        ChangeNotifierProvider(
          create: (BuildContext context){
            return WishListController(); 
          }
        )  
      ],
      builder: (context, child){
        return MaterialApp(
          title: "Provider Demo",
          debugShowCheckedModeBanner: false,
          theme: ThemeData( 
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: GetProductDetails(),
        );
      },
    );
  }
}