#include <stdio.h>
#include <string.h>

int main() {
	char in[1024], *inptr, *num;
	int first, second;

	while(fgets(in, sizeof(in), stdin)) {
		inptr = in;

		if(! (num = strsep(&inptr, " ")))
			continue;
		first = atoi(num);

		if(! (num = strsep(&inptr, " ")))
			continue;
		second = atoi(num);

		printf("Sum is %i\n", first + second);
	}
	return 0;
}
