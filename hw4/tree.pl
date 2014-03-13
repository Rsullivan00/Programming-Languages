insert(X, empty, node(X, empty, empty)).

insert(X, node(Y, L, R), node(Y, NewL, R)):- 
    X<Y,!,
    insert(X, L, NewL).

insert(X, node(Y, L, R), node(Y, L, NewR)):- 
    insert(X, R, NewR).

exists(X, node(X, _, _)).
exists(X, node(Y, L, _)):-X<Y, !, exists(X, L).
exists(X, node(Y, _, R)):-exists(X, R).
