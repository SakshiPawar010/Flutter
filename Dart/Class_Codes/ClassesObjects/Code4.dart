import 'dart:io';
class Country{
	String? cName = "Bharat";
	String? cCapital = "Delhi";
	num? cPopulation = 142.86;
	
	void countryInfo(){
		print(cName);
		print(cCapital);
		print(cPopulation);
	}
}
void main(){
	Country obj = new Country();
	obj.countryInfo();

	stdout.write("Enter Country Name : ");
	obj.cName = stdin.readLineSync();
	
	stdout.write("Enter Capital of country : ");
	obj.cCapital = stdin.readLineSync();
	
	stdout.write("Enter Country Population : ");
	obj.cPopulation = num.parse(stdin.readLineSync()!);

	obj.countryInfo();
}
