
class ThreadDemo{
	public static void main(String [] args){
		System.out.println("Statement 1");
		System.out.println("Statement 2");
		try{
			Thread.sleep(5000);
		}catch(InterruptedException ie){
		
		}
		System.out.println("Statement 3");
		System.out.println("Statement 4");
	}
}
