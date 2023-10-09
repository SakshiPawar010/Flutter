
class Company{
	String? compName;
	String? loc;

	Company(this.compName,this.loc);

	void compInfo(){
		print(compName);
		print(loc);
	}
}

class Employee extends Company{
	int? empID;
	String? empName;

	Employee(this.empID,this.empName,String compName,String loc):super(compName,loc);	//Compiler replaces super into company therefore it is no lonager super() hence call() method  is not required here. and it is also call parent constuctor but not like Company() hence no ERROR .

	void empInfo(){
		print(empID);
		print(empName);
	}
}

void main(){
	Employee obj = new Employee(63,"Sakshi","Google","Pune");

	obj.empInfo();
	obj.compInfo();
}
