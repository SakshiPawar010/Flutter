import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pracrical/controllers/wishlist_controller.dart';

class WishListScreen extends StatefulWidget{
  const WishListScreen({super.key});

  @override 
  State createState() => _WishListScreenState();
}

class _WishListScreenState extends State{
  @override
  Widget build(BuildContext context) {
    var wishListObj = Provider.of<WishListController>(context,listen: false);
    return Scaffold(
      appBar: AppBar( 
        title: const Text("WishList Screen"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: wishListObj.listOfWishlistProducts.length,
        itemBuilder:(context, index) {
          return Row( 
            children: [ 
              Image.network("${wishListObj.listOfWishlistProducts[index].productImage}"),
              const SizedBox(width: 20,),
              Column( 
                children: [ 
                  Text("${wishListObj.listOfWishlistProducts[index].productName}"),
                  const SizedBox(height: 20,),
                  Text("${wishListObj.listOfWishlistProducts[index].price}"),
                  const SizedBox(height: 20,),
                  GestureDetector( 
                    onTap:() {
                      
                    },
                    child: Icon( 
                      (wishListObj.listOfWishlistProducts[index].isFavorite!)
                        ? Icons.favorite_rounded
                        : Icons.favorite_outline_rounded
                    ),
                  )
                ],
              )
            ],
          );
        },
      ),
    ); 
  }
}