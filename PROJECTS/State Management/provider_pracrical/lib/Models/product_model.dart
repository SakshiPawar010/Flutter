
class ProductModelClass {
  String? productName;
  String? productImage;
  String? price;
  bool? isFavorite = false;
  int? quantity = 0;

  ProductModelClass({
    this.productImage, 
    this.productName, 
    this.price,
    this.isFavorite = false,
    this.quantity = 0,
  });

}