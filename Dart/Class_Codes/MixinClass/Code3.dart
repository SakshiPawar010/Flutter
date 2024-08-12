
//abstract mixin Demo1{		//Error: Can't have modifier 'abstract' here.
//mixin class is a by default abstract mixin class

mixin Demo1{
	void fun1(){
		print("In  fun1-Demo1");
	}
	void fun2();
}

mixin Demo2{
	void fun3(){
		print("IN fun2-Demo2");
	}
	void fun4();
}

//By using mixin class we are able to overcome the drawdack of overring methods in case of interface 
class DemoChild with Demo1,Demo2{	   
	void fun2(){
		print("In fun2-DemoChild");
	}
	void fun4(){
		print("In fun4-DemoChild");
	}
}

//When we are not using mixin class we have to implement all methods in parent class like-
/*class DemoChild implements Demo1,Demo2{    
	void fun1(){
                print("In fun1-DemoChild");
        }
	void fun2(){
                print("In fun2-DemoChild");
        }
	void fun3(){
                print("In fun2-DemoChild");
        }
        void fun4(){
                print("In fun4-DemoChild");
        }
}*/

void main(){
	DemoChild obj = new DemoChild();
	obj.fun1();
	obj.fun2();
	obj.fun3();
	obj.fun4();
}
