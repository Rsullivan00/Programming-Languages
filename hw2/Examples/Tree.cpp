# include <iostream>
# include "Tree.h"

using namespace std;


class Node {
    int data;
    Node *left;
    Node *right;

public:
    Node(int);
    void insert(int);
    bool member(int) const;
};


Node::Node(int x)
{
    left = NULL;
    right = NULL;
    data = x;
}


void Node::insert(int x)
{
    if (x < data)
	if (left == NULL)
	    left = new Node(x);
	else
	    left->insert(x);

    else if (x > data)
	if (right == NULL)
	    right = new Node(x);
	else
	    right->insert(x);
}


bool Node::member(int x) const
{
    if (x < data)
	return left != NULL ? left->member(x) : false;

    if (x > data)
	return right != NULL ? right->member(x) : false;

    return true;
}


Tree::Tree()
{
    root = NULL;
}


void Tree::insert(int x)
{
    if (root == NULL)
	root = new Node(x);
    else
	root->insert(x);
}


bool Tree::member(int x) const
{
    return root != NULL ? root->member(x) : false;
}


int main()
{
    int x;
    Tree t;


    cin >> x;

    while (x != -1) {
	t.insert(x);
	cin >> x;
    }

    cin >> x;

    while (x != -1) {
	cout << t.member(x) << endl;
	cin >> x;
    }
}
