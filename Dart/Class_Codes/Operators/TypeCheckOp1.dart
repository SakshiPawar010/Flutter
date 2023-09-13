void main(){
	int x = 10;
	double y = 20.5;
	num z =30;

	print(x.runtimeType);
	print(y.runtimeType);
	print(z.runtimeType);

	print(x is int);      //true
	print(y is int);      //false
	print(y is num);      //true
	print(z is! int);     //false
}
