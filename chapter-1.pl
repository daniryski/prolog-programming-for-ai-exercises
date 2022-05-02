% Excerpt from Figure 1.8 The family programm
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).


female(pam).
female(liz).
female(ann).
female(pat).


mother(X, Y) :-
  parent(X, Y),
  female(X).


sister(X, Y) :-
  parent(Z, X),
  parent(Z, Y),
  female(X),
  X \== Y. % different(X, Y).

% Exercise 1.1
% ?- parent(jim, X).
% false.

% ?- parent(X, jim).
% X = pat.

% ?- parent(pam, X), parent(X, pat).
% X = bob.

% ?- parent(pam, X), parent(X, Y), parent(Y, jim).
% X = bob,
% Y = pat.


% Exercise 1.2
% (a)
% parent(X, pat).

% (b)
% parent(liz, X).

% (c)
% parent(X, Y), parent(Y, pat).


% Exercise 1.3
% (a)
happy(X) :-
  parent(X, _).

% (b)
hastwochildren(X) :-
  parent(X, Y),
  sister(Y, _).


% Exercise 1.4
grandchild(Z, X) :-
  parent(Y, Z),
  parent(X, Y).


% Exercise 1.5
aunt(X, Y) :-
  sister(X, Z),
  parent(Z, Y).


% Exercise 1.6
predecessor(X, Z) :-
  parent(X, Z).

predecessor(X, Z) :-
  parent(Y, Z),
  predecessor(X, Y).

% Yes, this is also a proper definition of predecessors.
%  ________predecessor________
% |                           |
% X --> ... --> Y --parent--> Z
% |_predecessor_|


% Exercise 1.7
% (a)
% ?- parent(pam, bob).
% parent(pam, bob)
% true
%
% (b)
% ?- mother(pam, bob).
% mother(pam, bob)
% |
% parent(pam, bob), female(pam)
% true
%
% (c)
% ?- grandparent(pam, ann).
% grandparent(pam, ann)
% |
% parent(pam, X), parent(X, ann)
% |
% | X = bob by rule parent(pam, bob)
% |
% parent(pam, bob), parent(bob, ann)
% true
%
% (d)
% ?- grandparent(bob, jim).
% grandparent(bob, jim)
% |
% parent(bob, X), parent(X, jim)------
% |                                   |
% | X = ann by rule parent(bob, ann); | X = pat by rule parent(bob, pat)
% |                                   |
% parent(bob, ann), parent(ann, jim)  parent(bob, pat), parent(pat, jim)
% false                               true
%
% Backtracking occurs after the first 'false' leaf.
