import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider_pracrical/Models/product_model.dart';

class WishListController with ChangeNotifier{
  List<ProductModelClass> listOfWishlistProducts = [];
  
  void addDataToWishlist({ProductModelClass? obj}){
    listOfWishlistProducts.add(obj!);
    log("Product Added To Wishlist");
  }
  void removeWishList({required int index}){
    listOfWishlistProducts.removeAt(index);
    notifyListeners();
  }
}