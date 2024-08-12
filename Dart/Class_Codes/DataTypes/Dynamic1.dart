//By using dynamic data type we can convert value of specific data type into another data type 

void main(){
	dynamic x=10;
	dynamic y=20;
	print(x.runtimeType);          //int
	print(y.runtimeType);          //int
	x=20.5;
	y=30.5;
	print(x.runtimeType);          //double
	print(y.runtimeType);          //double
}
