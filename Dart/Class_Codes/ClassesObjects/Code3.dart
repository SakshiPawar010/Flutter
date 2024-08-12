import 'dart:io';

class Employee{
	String? empName = "Sakshi";
	int? empID = 12;
	num? sal = 1.5;

	void empInfo(){
		print(empName);
		print(empID);
		print(sal);
	}
}

void main(){
	Employee empObj = new Employee();
        empObj.empInfo();

	stdout.write("Enter employee name : ");
	empObj.empName = stdin.readLineSync();

	stdout.write("Enter employee ID : ");
	empObj.empID = int.parse(stdin.readLineSync()!);

	stdout.write("Enter employee salary : ");
	empObj.sal = num.parse(stdin.readLineSync()!);

	empObj.empInfo();
}
