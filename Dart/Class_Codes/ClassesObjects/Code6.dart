// Object Creation

/* 
   -In dart there are 4 ways to create object
*/

class Company{
	int empCount=500;
	String compName="Google";
	String loc="Pune";

	void compInfo(){
		print(empCount);
		print(compName);
		print(loc);
	}

	/*void Company(){
		print("In Method");
	}*/                               //Error: Constructors can't have a return type.Try removing the return type.
}

void main(){
	Company obj1 = new Company();
	obj1.compInfo();

	Company obj2 = Company();
	obj2.compInfo();

	new Company().compInfo();

	Company().compInfo();	
	//If there is a method named as same as class name then it will does not work.
}
