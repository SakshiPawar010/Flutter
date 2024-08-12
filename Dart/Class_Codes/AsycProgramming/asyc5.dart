
void fun1(){
	for(int i=0; i<=10; i++){
		print("In Fun 1");
	}
}

void fun2(){
	for(int i=0; i<=5; i++){
		print("In Fun 2.1");
	}
	Future.delayed(Duration(seconds:5));
	for(int i=0; i<=3; i++){
		print("In Fun 2.2");
	}
}

void main(){
	print("Start main");
	fun1();
	fun2();
	print("End main");
}
