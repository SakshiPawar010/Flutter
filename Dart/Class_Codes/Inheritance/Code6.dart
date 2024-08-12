
class Parent{
	int x=10;
	String str1="name";

	void parentMethod(){
		print(x);
		print(str1);
	}
}

class Child extends Parent{
	int x=20;
	String str1="data";

	void childMethod(){
		print(x);
		print(str1);
	}
}

void main(){
	Child obj1 = new Child();
	//Parent obj1 = new Child();

	print(obj1.x);
	print(obj1.str1);
	obj1.parentMethod();    //it should have to print < 10 data > but in dart child inherite all things of parent except constructor and all insatance variables of class are stores in constructor hence here this statement accesses nearest value of 'x' and 'str1' < 20 data >

	print(obj1.x);
	print(obj1.str1);
	obj1.childMethod();
}
/*Output:
	20
	data
	20
	data
	20
	data	
	20
	data
*/


