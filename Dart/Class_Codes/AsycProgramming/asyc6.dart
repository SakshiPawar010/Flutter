
String getOrder(){
	var order = "Burger";
	//Future.delayed(Duration(seconds:5));
	return order;
}

Future<String> getOrderMessage() async{
	var order =  await getOrder();
	return "Your Order is $order";
}

Future<void> main() async{
	print("Start");
	print( await getOrderMessage());
	print("End");
} 
