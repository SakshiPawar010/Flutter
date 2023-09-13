
void main(){
	int x = 10;
	int y = 8;
	
	//print(x && y);            //Error: A value of type 'int' can't be assigned to a variable of type 'bool'.
	
	print((x > y) && (x < y));
	print((x != y) || (x == y));
}
