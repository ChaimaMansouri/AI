
%Chaima Mansouri.
%3 ing informatique DS.
%

%Facts
father(ali, djamila).
father(ali, mohamed).
father(mohamed, reda).
mother(samia, reda).
father(omar, samia).

%Ask questions:

%?-father(ali, djamila).
%true.
%?-father(ali, reda).
%false.
%?-father(ali,X).
%X=djamila.
%X=mohamed.
%?-mother(Y,reda).
%Y=samia.
%?-mother(Z,mohamed).
%false.
%?-father(mohamed,X).
%X=reda.
%?-mother(samira,X).
%?-grandparent(ali,reda).
%Error

%Rules:

parent(X,Y):-father(X,Y);mother(X,Y).
grandparent(X,Y):-parent(X,Z),parent(Z,Y).
ancestor(X,Y):-parent(X,Y).
