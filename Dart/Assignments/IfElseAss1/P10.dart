
void main(){
	//int units=90;
	int units=120;
	int totalCost=0;

	if(units<0){
		print("Enter valid units.");
	}else if(units>=0 && units<90){
		print("No charge");
	}else if(units>=90 && units<180){
		totalCost=units*6;
		print(totalCost);
	}else if(units>=180 && units<250){
		totalCost=units*10;
		print(totalCost);
	}else{
		totalCost=units*15;
		print(totalCost);
	}
}
