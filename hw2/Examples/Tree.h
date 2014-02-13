# ifndef TREE_H
# define TREE_H

class Node;

class Tree {
    Node *root;

public:
    Tree();
    void insert(int);
    bool member(int) const;
};

# endif /* TREE_H */
