//****Interface****

abstract class Developer{
	void develop(){
		print("We buil softwares");
	}
	void type();
}

/*class MobileDev implements Developer{		//Error: The non-abstract class 'MobileDev' is missing implementations for these members:- Developer.develop
	void type(){
		print("Flutter Developer");
	}
}*/

//When we implements any class or abstract class this parent class becomes an INTERFACE there is no need of any keyword as "Interface" in dart. 
//We had to give body for every single method in parent class in Child class.

class MobileDev implements Developer{       
	void develop(){
		print("We build mobile apps");
	}
	void type(){
                print("Flutter Developer");
        }
}

void main(){
	Developer obj = new MobileDev();
	obj.develop();
	obj.type();
}
