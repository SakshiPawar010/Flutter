
void main(){
	int x = 10;
	int y = 8;
	print((++x < ++y) && (--x > ++x));    //Both condition has to be checked

	int a = 5;
	int b = 6;
	print((++a < ++b) || (--a > ++b));   //In Condition of || (OR) if First condition is True then dosen't check Second Condition

	print(x);
	print(y);
	print(a);
	print(b);
}
