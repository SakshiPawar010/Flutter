int palindromeCount(int start, int end){
  int count = 0;
  
  for(int j = start; j<=end; j++){
    int rev = 0;
    int i = j;
    while(i != 0 ){    
      int rem = j%10;
      rev = (rev*10) + rem;
      i = i~/10 ;
    }  
    if(rev == j ){
      count ++;
    }
    
  }
  return count;
}