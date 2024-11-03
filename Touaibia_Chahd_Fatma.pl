father(ali,djamila).
father(ali,mohamed).
father(mohamed,reda).
mother(samia,reda).
father(omar,samia).
grandparent(X,Y):-father(X,Z),father(Z,Y).
grandparent(X,Y):-mother(X,Z),mother(Z,Y).
grandparent(X,Y):-father(X,Z),mother(Z,Y).
grandparent(X,Y):-mother(X,Z),father(Z,Y).
parent(X,Y):-mother(X,Y);father(X,Y).
ancestor(X, Y):-parent(X, Y). 
ancestor(X, Y):-parent(X, Z), ancestor(Z, Y).