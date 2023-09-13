import 'dart:io';

void main(){
        print(stdin.runtimeType);

        //int age = stdin.readLineSync();    //Error: A value of type 'String?' can't be assigned to a variable of type 'int'.

        int? age = int.parse(stdin.readLineSync()!);        //! == not null value
        print("Age = $age");
}
