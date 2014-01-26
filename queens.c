# include "stdio.h"
# include "stdlib.h"

# define SIZE 8 

int board[SIZE * SIZE];

int available(int spot) {
	int i,diff;
	for (i = spot % SIZE; i < SIZE * SIZE; i += SIZE) {
		if (board[i])
			return 0;
		diff = abs(spot/SIZE - i/SIZE);
		if (i + diff < i/SIZE + 8 && board[i + diff])
			return 0;
		if (i - diff >= i/SIZE && board[i - diff])
			return 0;
	}

	return 1;		
}

int placeQueen(int column) {
	int i;

	if (column >= SIZE)
		return 1;

	for (i = column * SIZE; i < column * SIZE + SIZE; i++) {
		if (available(i)) {
			board[i] = 1;
			if (!placeQueen(column + 1))
				board[i] = 0;
			else
				return 1;
		}
	}

	return 0;
}

void printBoard(void) {
	int i, j;
	for (i = 0; i < SIZE; i++) {
		for (j = 0; j < SIZE; j++) {
			printf("%d ", board[i * SIZE + j]);
		}
		printf("\n");
	}
}

int main(void) {
	placeQueen(0);

	printBoard();
	return 0;
}
