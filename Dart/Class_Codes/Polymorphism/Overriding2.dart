class Core2Web{
	int? noOfChildComp;
	String? CEO;

	Core2Web(this.noOfChildComp, this.CEO);
	
	void teacher(){
		print("Shashi Sir");
	}
	void batch(){
		print("JAVA");
	}
}

class Incubator extends Core2Web{ 
	int? noOfEmp;
	
	Incubator(this.noOfEmp,int noOfChildComp,String CEO):super(noOfChildComp,CEO);

	void batch(){
		print("Flutter");
	}
}

void main(){
	Core2Web obj=new Incubator(7,2,"Shashi Bagal");	
	obj.teacher();
	obj.batch();
}
