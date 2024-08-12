import "dart:io";

import "dartSecond.dart";

void main(){
  print("Enter Range");

  print("Enter Starting Range:") ;
  int start = int.parse(stdin.readLineSync()!);

  print("Enter Ending Range:");
  int end = int.parse(stdin.readLineSync()!);

  int count = palindromeCount( start ,end);
  print(count);
}