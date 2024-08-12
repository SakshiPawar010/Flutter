
#include <stdio.h>
void main(){
	printf("%d\n",(*stdin) ._file);
	printf("%d\n",(*stdout) ._file);
	printf("%d\n",(*stderr) ._file);
}
