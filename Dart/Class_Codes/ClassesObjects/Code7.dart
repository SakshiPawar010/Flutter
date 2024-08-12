//Change in Multiple Objects of same class

class Employee{
	int empId=10;
	String empName="Sakshi";
	double sal=1.35;

	void empInfo(){
		print(empId);
		print(empName);
		print(sal);
	}
}

void main(){
	Employee obj1= new Employee();
	obj1.empInfo();

	Employee obj2 = new Employee();
	obj2.empInfo();

	obj1.sal=1.5;             //make change in obj1
	obj1.empInfo();           //Only for obj1
	
	obj2.empInfo();           //It will does not affect the data in obj2
}
