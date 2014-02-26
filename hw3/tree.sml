datatype Tree = nil | root of Node;

datatype Node = left of Tree * right of Tree;

fun insert x nil = x
  | insert x (Node(y, left, right)) =
        if x < y then
            insert x left
        else 
            insert x right

fun member x nil = false
  | member x (Node(y, left, right)) =
        if x < y then
            member x left
        else if x > y then
            member x right
        else 
            true
