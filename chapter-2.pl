% Exercise 2.1
% (a) Diana is a variable
% (b) diana is an atom
% (c) 'Diana' is an atom
% (d) _diana is a variable
% (e) 'Diana goes south' is an atom
% (f) goes(diana, south) is a structure
% (g) 45 is a number
% (h) 5(X, Y) is not a syntactically correct Prolog object
% (i) +(north, west) is a structure
% (j) three(Black(Cats)) is not a syntactically correct Prolog object


% Exercise 2.2
rectangle(point(_, _), point(_, _), point(_, _)).

rectangle(point(0, 0), point(2, 0), point(2, 2)).


square(point(_, _), point(_, _)).

square(point(0, 0), point(1, 1)).


circle(point(X, Y), seg(point(X, Y), point(_, _))).

circle(point(0, 0), seg(point(0, 0)), point(0, 1)).


% Exercise 2.3
% (a) point(A, B) = point(1, 2) will succeed with A = 1, B = 2

% (b) point(A, B) = point(X, Y, Z) will fail

% (c) plus(2, 2) = 4 will fail

% (d) +(2, D) = +(E, 2) will succeed with E = 2, D = 2

% (e) triangle(point(-1, 0), P2, P3) = triangle(P1, point(1, 0), point(0, Y)) will succeed with P1 = point(-1, 0), P2 = point(1, 0), P3 = point(0, Y)
% this defines the family of isosceles triangles with a base seg(point(-1, 0), point(1, 0))


% Exercise 2.4
% seg(point(5, Y1), point(5, Y2))


% Exercise 2.5
regular(rectangle(point(X1, Y1), point(X2, Y1), point(X2, Y2))) :-
  X1 < X2,
  Y1 < Y2.

regular(rectangle(point(X1, Y1), point(X1, Y2), point(X2, Y2))) :-
  Y1 < Y2,
  X1 > X2.

regular(rectangle(point(X1, Y1), point(X2, Y1), point(X2, Y2))) :-
  X1 > X2,
  Y1 > Y2.


% Exercise 2.6
f(1, one).

f(s(1), two).

f(s(s(1)), three).

f(s(s(s(X))), N) :-
  f(X, N).

% (a) ?- f(s(1), A).
% A = two.

% (b) ?- f(s(s(1)), two).
% false.

% (c) ?- f(s(s(s(s(s(s(1)))))), C).
% C = one.

% (d) ?- f(D, three).
% D = s(s(1)) ;
% D = s(s(s(s(s(1))))) .


% Exercise 2.7
relatives(X, Y) :-
  predecessor(X, Y);
  predecessor(Y, X);
  predecessor(Z, X), predecessor(Z, Y);
  predecessor(X, Z), predecessor(Y, Z).


% Exercise 2.8
translate(1, one).
translate(2, two).
translate(3, three).


% Exercise 2.9
% Excerpt from Figure 2.10
big(bear).


brown(bear).


dark(Z) :-
  black(Z).

dark(Z) :-
  brown(Z).


% ?- big(X), dark(X).
% big(bear), dark(bear)
% |
% dark(bear)------
% |               |
% | black(bear)   | brown(bear)
% |               |
% false           true


% Exercise 2.10
% ?- X = f(X). produces X = f(X), because there is no occurs check
