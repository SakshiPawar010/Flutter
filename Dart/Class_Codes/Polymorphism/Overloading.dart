
//Overloading does not work in Dart

class Parent{
	int x=10;
	int y=20;

	void disp(int x){
		print(x);
	}

	void disp(int x,int y){		//Error: 'disp' is already declared in this scope.
		this.x=x;
		this.y=y;
		print(x);
		print(y);
	}
}

void main(){
	Parent obj = new Parent();
	obj.disp(10);
	obj.disp(10,20);	//Error: Too many positional arguments: 1 allowed, but 2 found.
}
