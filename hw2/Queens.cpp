/* 	Queens.cpp
	Rick Sullivan
*/

# include "Queens.h"
# include <assert.h>
# include <cmath>
# include <iostream>
# include <vector>

int boardSize; 

/*****************
	PIECE	
*****************/
void Piece::place(int newRow, int newCol) {
	assert(newRow < boardSize && newCol < boardSize);
	assert(newRow >= 0 && newCol >= 0);
		
	_row = newRow;
	_column = newCol;
}

/*****************
	ROOK	
*****************/
bool Rook::menaces(const Piece &p) const {
	return p.row() == _row || p.column() == _column;
}

/*****************
	QUEEN
*****************/
bool Queen::menaces(const Piece &p) const {
	if (Rook::menaces(p))
		return true;
	return std::abs(p.row() - _row) == std::abs(p.column() - _column);
}

/*****************
	KNIGHT
*****************/
bool Knight::menaces(const Piece &p) const {
	if (std::abs(p.row() - _row) == 2 && std::abs(p.column() - _column) == 1)
		return true;
	if (std::abs(p.row() - _row) == 1 && std::abs(p.column() - _column) == 2)
		return true;
	return false;
}

/*****************
	AMAZON	
*****************/
bool Amazon::menaces(const Piece &p) const {
	return Queen::menaces(p) || Knight::menaces(p);
}

int main() {
	std::cin >> boardSize;
	
	std::vector<Queen> pieces(boardSize);
	int successes = 0;
	bool succeeds;

	for (int i = 0; i < boardSize; i++) {
		for (int j = 0; j < boardSize; j++) {
			succeeds = true;
			pieces[i].place(i, j);
			for (int k = 0; k < boardSize; k++) {
				for (int l = 0; l < boardSize; l++) {
					if (pieces[k].menaces(pieces[l]))
						succeeds = false;
				}
			}
			if (succeeds)
				successes++;
		}
	}

	std::cout << "Number of sucesses: " << successes << std::endl;
	return 0;
}
