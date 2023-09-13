import 'dart:io';

void main(){
	int? empID;
	String? empName;
	double? sal;

	print("Enter Employee Name : ");
	empName = stdin.readLineSync();

	print("Enter Employee ID : ");
	empID = int.parse(stdin.readLineSync()!);

	print("Enter Employee Salary : ");
	sal = double.parse(stdin.readLineSync()!);

	print("ID : $empID");
	print("Name : $empName");
	print("Salary : $sal");
}
