
class Student{
	String name = "Rajesh";
	int age = 28;
	Student(String name, int age){
		this.name=name;
		this.age=age;
	}
	void displayInfo(){
		print('Name:$name, Age:$age');
	}
}
void main(){
	var student1=Student('Ganesh',20);

	student1.age+=1;

	student1.displayInfo();
}
