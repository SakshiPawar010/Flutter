
abstract class Developer{
	void develop(){
		print("We develop softwares");
	}
	void type();
}

class MobileDev extends Developer{
	void type(){
		print("Flutter Developer");
	}
}

class WebDev extends Developer{
	void type(){
		print("FrontEnd Developer");
	}
}

void main(){
	Developer obj1 = new MobileDev();
	obj1.develop();
	obj1.type();

	Developer obj2 = new WebDev();
	obj2.develop();
        obj2.type();

	WebDev obj3 = new WebDev();
	obj3.develop();
        obj3.type();

	//Developer obj = new Developer();	//Error: The class 'Developer' is abstract and can't be instantiated.
}
