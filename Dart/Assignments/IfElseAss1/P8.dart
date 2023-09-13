
void main(){
	//int x=15;
	//int x=6;
	//int x=10;
	int x=8;

	if(x%3==0 && x%5==0){
		print("Divisible by both.");
	}else if(x%3==0){
		print("Divisible by 3.");
	}else if(x%5==0){
		print("Divisible by 5");
	}else{
		print("Not divisible by 3 or 5");
	}
}
