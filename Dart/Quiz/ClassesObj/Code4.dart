class Test{
	int x;
	static int y=20;
	Test(this.x){
		print("Test");
	}
}

void main(){
	Test obj=Test(10);
	print(obj.x);
	print(obj.y);
}
