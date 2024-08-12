
class Demo{
	void fun(){
		print("In Fun");
	}
	void gun(){
		print("In Gun");
	}
}
mixin Test implements Demo{

}
class Test2 with Test{
	void fun(){
		print("In Fun");
	}
	void gun(){
		print("In fun");
	}
}
void main(){
	Test2 obj = new Test2();
}
