import 'dart:core';           //No need to import the CORE package automatilcally imports everytime
import 'dart:io';

void main(){
	print(stdin.runtimeType);
	
	String? name = stdin.readLineSync();
	print("Name = $name");
}
