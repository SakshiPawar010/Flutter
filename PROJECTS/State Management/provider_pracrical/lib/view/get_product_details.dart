import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pracrical/controllers/product_controller.dart';
import 'package:provider_pracrical/Models/product_model.dart';
import 'package:provider_pracrical/view/product_list_screen.dart';

class GetProductDetails extends StatelessWidget{
  GetProductDetails({super.key});

  final TextEditingController _productImageController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log("In Product Details Build");
    return Scaffold( 
      appBar: AppBar(
        title: const Text("Get Product Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column( 
          children: [
            const SizedBox(height: 20,),
        
            //Product Image
            TextFormField( 
              controller: _productImageController,
              decoration: InputDecoration( 
                hintText: "Add Image",
                enabledBorder: OutlineInputBorder( 
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder( 
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
        
            const SizedBox(height: 20,),
        
            //Product Name        
            TextFormField( 
              controller: _productNameController,
              decoration: InputDecoration( 
                hintText: "Enter Name",
                enabledBorder: OutlineInputBorder( 
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder( 
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            
            //Add Price
            TextFormField( 
              controller: _productPriceController,
              decoration: InputDecoration( 
                hintText: "Add Price",
                enabledBorder: OutlineInputBorder( 
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder( 
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
        
            const SizedBox(height: 20,),
            
            ElevatedButton(
              onPressed: (){
                var obj =  ProductModelClass( 
                  isFavorite: false,
                  price: _productPriceController.text.trim(),
                  productName: _productNameController.text.trim(),
                  productImage: _productImageController.text.trim(),
                  quantity: 0,
                );
        
                Provider.of<ProductController>(context,listen:false).
                addProductData(pObj: obj);
        
                _productImageController.clear();
                _productNameController.clear();
                _productPriceController.clear();
        
              }, 
              child: const Text("Add"),
            ),
            const SizedBox(height: 20,),
        
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const ProductListScreen();
                }));
              },
              child: const Text("Submit") 
            )
          ],
        ),
      ),
    );
  }
}