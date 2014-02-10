# ifndef QUEENS_H
# define QUEENS_H

class Piece {
protected:
	int _row;
	int _column;
	
public:
	int row() const { return _row; }
	int column() const { return _column; }
	void place(int newRow, int newCol);
	virtual bool menaces(const Piece &p) const = 0;
};

class Rook : public Piece {
public:
	virtual bool menaces(const Piece &p) const;
};

class Queen : public Rook {
public:
	virtual bool menaces(const Piece &p) const;
};

class Knight : public Piece {
public:
	virtual bool menaces(const Piece &p) const;
};

/* Should also inherit from Knight, but couldn't fix errors. */
class Amazon : public Queen {
public:
	bool menaces(const Piece &p) const;
};
# endif
