
abstract class Developer{
	int x=10;
	Developer(){
		print("Developer Constructor");
	}
	void develop(){
		print("We build softwares");
	}
	void type();
}

class MobileDev implements Developer{

	int x=20;
	//If we don't implement x again in Child class it will also give an error like it give in method scenario as
	//Error: The non-abstract class 'MobileDev' is missing implementations for these members:
 	//- Developer.x

	void develop(){
		print("We build apps");
	}
	void type(){
		print("Flutter Developer");
	}
}

void main(){
	Developer obj = new MobileDev();
	print(obj.x);
}
