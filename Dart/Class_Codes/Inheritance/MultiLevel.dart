
//**Multilevel Inheritance**

class ICC{
	ICC(){
		print("ICC Constructor");
	}
}

class BCCI extends ICC{
	BCCI(){
		print("BCCI Constructor");
	}
}

class IPL extends BCCI{
	IPL(){
		print("IPL Constructor");
	}
}

void main(){
	ICC obj1 = new ICC();         //ICC Constructor

	BCCI obj2 = new BCCI();       //ICC Constructor
				      //BCCI Constructor

	IPL obj3 = new IPL();         //ICC Constructor
                                      //BCCI Constructor
				      //IPL Constructor
}
