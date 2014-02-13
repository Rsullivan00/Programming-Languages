/* 	Queens.cpp
	Rick Sullivan


	Solutions for board sizes:
		Board Size	Rooks	Queens	Amazons
		1			1		1		1
		2			2		0		0
		3			6		0		0
		4			24		0		0
		5			120		10		0
		6			720		4		0
		7			5040	40		0
		8			40320	92		0
		9			362880	352		0
		10			3628800	724		4
*/

# include "Queens.h"
# include <assert.h>
# include <cmath>
# include <iostream>
# include <vector>

int boardSize; 

Rook *rooks;
Queen *queens;
Amazon *amazons;

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
	/* From Knight class */
	if (std::abs(p.row() - _row) == 2 && std::abs(p.column() - _column) == 1)
		return true;
	if (std::abs(p.row() - _row) == 1 && std::abs(p.column() - _column) == 2)
		return true;
	/* /Knight */
	return Queen::menaces(p); // || Knight::menaces(p);
}

int getSolutions(Piece *pieces, int pieceNum) {
	if (pieceNum >= boardSize)
		return 1;

	int numSolutions = 0;
	bool isSolution;

	for (int i = 0; i < boardSize; i++) {
		pieces[pieceNum].place(pieceNum, i);
		isSolution = true;
		for (int j = 0; j < pieceNum; j++) {
			if (pieces[pieceNum].menaces(pieces[j])) {
				isSolution = false;	
				break;
			}
		}
		
		if (isSolution)
			numSolutions += getSolutions(pieces, pieceNum + 1);
	}	

	return numSolutions;
}

int main() {
	std::cout << "Input board size (8 = an 8 by 8 board)." << std::endl;
	std::cin >> boardSize;

	rooks = new Rook[boardSize];
	int successes = getSolutions(rooks, 0);
	std::cout << "Number of Rook sucesses: " << successes << std::endl;

	queens = new Queen[boardSize];
	successes = getSolutions(queens, 0);
	std::cout << "Number of Queen sucesses: " << successes << std::endl;

	amazons = new Amazon[boardSize];
	successes = getSolutions(amazons, 0);
	std::cout << "Number of Amazon sucesses: " << successes << std::endl;

	delete[] rooks;
	delete[] queens;
	delete[] amazons;

	return 0;
}
