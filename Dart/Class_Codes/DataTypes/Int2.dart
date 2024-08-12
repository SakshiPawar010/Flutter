// Error: Non-nullable variable 'x' must be assigned before it can be used.

main(){
	int x;
	print(x);
}


//NO ERROR : Because x is not used yet. Error comes when variable is used before assigning value to it.


/*main(){
	int x;
}*/
