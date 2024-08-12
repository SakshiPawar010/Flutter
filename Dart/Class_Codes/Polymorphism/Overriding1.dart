
class Parent{
	void career(){
		print("Enggineering");
	}
	void marry(){
		print("Vicky");
	}
}
class Child extends Parent{
	void marry(){
		print("Rohit Saraf");
	}
}
void main(){
	Child obj = new Child();
	obj.career();
	obj.marry();
}
