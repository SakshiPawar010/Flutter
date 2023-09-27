
class Demo{
	int x=10;
	static int y=20;

	void printData(){
		print(x);
		print(y);
	}
}

void main(){
	Demo obj1 = new Demo();
	obj1.printData();

	Demo obj2 = new Demo();
	obj2.printData();

	//obj1.y=50;               //Error: The setter 'y' isn't defined for the class 'Demo'.

	Demo.y=50;
	//If we do some change in static variable then it will show changes in both/all objects

	obj1.printData();
	obj2.printData();
}
