import 'package:flutter/material.dart';
import 'package:provider_pracrical/Models/product_model.dart';

class ProductController with ChangeNotifier{ 
  List<ProductModelClass> listOfProducts = [];
  //ProductModelClass? productModelClassObj;

  //Add Product Data
  void addProductData({required ProductModelClass pObj}){
    listOfProducts.add(pObj);
  }

  //Add to Favorite
  void addToFavorite({required int index}){
    // int index = listOfProducts.indexWhere((element) {
    //   return element == productModelClassObj;
    // });
    listOfProducts[index].isFavorite = listOfProducts[index].isFavorite!;
    notifyListeners();
  }

  //Add Quantity
  void addQuantity(int index){
    listOfProducts[index].quantity = listOfProducts[index].quantity! + 1;
    notifyListeners();
  }

  //Remove Quantity
  void removeQuantity(int index){
    listOfProducts[index].quantity = listOfProducts[index].quantity! - 1;
    notifyListeners();
  }
}