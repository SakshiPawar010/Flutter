void main(){
	int x=12;
	int y=13;
	do{
		int ans = x++ + ++y <<1;
		print(ans);
	}while(x<13);
}
