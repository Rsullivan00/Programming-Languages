/* 	Queens.cpp
	Rick Sullivan
*/

# include "Queens.h"

int boardWidth; 
vector<bool> board;

int Piece::row() {
	return position / boardWidth;
}

int Piece::column() {
	return position % boardWidth;
}

void Piece::place(int row, int col) {
	position = row * boardWidth + column;
}

/*****************
	QUEEN
*****************/

bool Queen::menaces(const Piece *p) {
	if (Rook::menaces(p)) return true;
	
	int pRow = p->row();
	int pColumn = p->column();

	// Incomplete
}	


/*****************
	ROOK	
*****************/

bool Rook::menaces(const Piece *p) {
	
}

/*****************
	AMAZON	
*****************/

bool Amazon::menaces(const Piece *p) {
	
}		
