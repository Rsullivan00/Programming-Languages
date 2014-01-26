# include "stdio.h"
# include "stdlib.h"

# define HIGH 8

typedef int * numbers;
numbers a;

void readarray(void) {
	int i;
	
	for (i = 0; i < HIGH; i++) 
		scanf("%d", &a[i]);	
}

void writearray(void) {
	int i;
	
	for (i = 0; i < HIGH; i++)
		printf("%d ", a[i]);
		
	printf("\n");
}

void exchange(int * a, int * b) {
	int t;
	t = *a;
	*a = *b;
	*b = t;	
}

int partition(numbers a, int y, int z) {
	int i, j, x;

	x = a[y];
	i = y;
	j = z;

	while (i < j) {
		while (a[j] > x) 
			--j;

		while (a[i] < x) 
			++i;

		if (i < j) 
			exchange(&a[i], &a[j]);
	}

	return j;	
}

void quicksort(numbers a, int m, int n) {
	int i;

	if (n > m) {
		i = partition(a, m, n);
		quicksort(a, m, i);
		quicksort(a, i+1, n);
	}
}

int main() {
	a = malloc(sizeof(int) * HIGH);
	readarray();
	quicksort(a, 0, HIGH - 1);
	writearray();

	free(a);

	return 0;
}
