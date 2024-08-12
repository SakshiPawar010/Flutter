
class Amazon{
	int? noOfChildComp;
	String? product;

	Amazon(this.noOfChildComp,this.product);

	void server(){
		print("AWS");
	}
	void fun(){
		print("E-Commerce");
	}
}
class PrimeVdo extends Amazon{
	String? productName;
	
	PrimeVdo(this.productName,int noOfChildComp, String product):super(noOfChildComp,product);

	void fun(){
		print("OTT");
	}
}
void main(){
	Amazon obj=new PrimeVdo("OTT",2,"Hotstar");
	obj.fun();
	obj.server();
}
