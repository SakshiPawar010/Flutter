
class BCCI{
	int bcciPlayers=11;
	String str="Board of Control for Cricket in India";

	void matchType(){
		print("T20/OneDay/Test");
	}
}

class IPL extends BCCI{
	int iplPlayers=12;
	String extraPlayer="Impact Player";

	void IPLMethod(){
		print("Indian Premier League");
	}
}

void main(){
	IPL obj1=new IPL();

	print(obj1.bcciPlayers);
	print(obj1.str);
	obj1.matchType();

	print(obj1.iplPlayers);
	print(obj1.extraPlayer);
	obj1.IPLMethod();
}
