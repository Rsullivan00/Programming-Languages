quicksort([], []).
quicksort([H|X], Y):- partition(X, L, R, H), 
                      quicksort(L, Lsorted),
                      quicksort(R, Rsorted),
                      append(Lsorted, [H|Rsorted], Y).

partition([], [], [], _).
partition([H|X], [H|Y], Z, P):- H < P, partition(X, Y, Z, P).
partition([H|X], Y, [H|Z], P):- H >= P, partition(X, Y, Z, P).
