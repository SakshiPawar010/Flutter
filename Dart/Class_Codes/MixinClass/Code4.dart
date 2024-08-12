//mixin implicitely had a constructor that's why we are not able to write constructor explicitely

mixin Demo{
	Demo(){
		//Error: Mixins can't declare constructors.
	}
	void fun1(){

	}
	void fun2();
}

void main(){
	Demo obj = new Demo();	//Error: The class 'Demo' is abstract and can't be instantiated.
}
