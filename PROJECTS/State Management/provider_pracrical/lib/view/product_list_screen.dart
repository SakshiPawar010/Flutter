import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pracrical/controllers/product_controller.dart';
import 'package:provider_pracrical/controllers/wishlist_controller.dart';
import 'package:provider_pracrical/view/wishlist_screen.dart';

class ProductListScreen extends StatelessWidget{
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var providerObj = Provider.of<ProductController>(context, listen:false);

    return Scaffold( 
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context){
                  return const WishListScreen();
                })
              );
            },
            icon:  const Icon(
              Icons.favorite_border_rounded,
              color: Colors.red,
            )
          ),         
        ],
        title: const Text("Product Details Screen"),
      ),
      body: ListView.builder( 
        itemCount: providerObj.listOfProducts.length,
        itemBuilder: (context, index) {
          return Container( 
            margin: const EdgeInsets.only(bottom: 50),
            child: Column( 
              children: [ 
                Image.network(
                  "${providerObj.listOfProducts[index].productImage}"
                ),
                const SizedBox(height: 10,),
                Text("${providerObj.listOfProducts[index].productName}"),
                const SizedBox(height: 10,),
                Text("${providerObj.listOfProducts[index].price}"),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                  children: [ 
                    //Is Favorite
                    Consumer<ProductController>(
                      builder:(context,provider,child){
                        log("In Fav Consumer");
                        return GestureDetector( 
                          onTap: (){ 
                            providerObj.addToFavorite(index: index);

                            if(providerObj.listOfProducts[index].isFavorite!){
                              Provider.of<WishListController>(context,listen: false).
                                addDataToWishlist(obj: providerObj.listOfProducts[index]);
                            }
                          },
                          child: Icon( 
                            (providerObj.listOfProducts[index].isFavorite!)
                              ? Icons.favorite_rounded
                              : Icons.favorite_outline_rounded,
                          ),
                        );                        
                      },
                    ),
                    Row(
                      children: [ 
                        GestureDetector( 
                          onTap: (){
                            providerObj.addQuantity(index);
                          },
                          child: const Icon( 
                            Icons.add,
                          ),
                        ),
                        const SizedBox(width: 5,),

                        //Quantity
                        Consumer<ProductController>(
                          builder: (context, value, child){
                            log("in Quantity");
                            return Text( 
                              "${providerObj.listOfProducts[index].quantity}"
                            );
                          },
                        ),
                        const SizedBox(width: 5,),
                        GestureDetector( 
                          onTap: () {
                            providerObj.removeQuantity(index);
                          },
                          child: const Icon(Icons.remove),
                        ),
                      ],                        
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}