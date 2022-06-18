% Exercise 5.1
p(1).
p(2) :- !.
p(3).


% (a) ?- p(X).
% X = 1 ;
% X = 2.

% (b) ?- p(X), p(Y).
% X = 1, Y = 1 ;
% X = 1, Y = 2 ;
% X = 2, Y = 1 ;
% X = 2, Y = 2.

% (c) ?- p(X), !, p(Y).
% X = 1, Y = 1 ;
% X = 1, Y = 2.


% Exercise 5.2
class(Number, positive) :-
  Number > 0,
  !.

class(Number, negative) :-
  Number < 0,
  !.

class(0, zero).


% Exercise 5.3
% split(Numbers, Positives, Negatives)
split1([N|Ns], [N|Poss], Negs) :-
  N >= 0,
  split1(Ns, Poss, Negs).

split1([N|Ns], Poss, [N|Negs]) :-
  N < 0,
  split1(Ns, Poss, Negs).

split1([], [], []).


split2([N|Ns], [N|Poss], Negs) :-
  N >= 0,
  !,
  split2(Ns, Poss, Negs).

split2([N|Ns], Poss, [N|Negs]) :-
  N < 0,
  !,
  split2(Ns, Poss, Negs).

split2([], [], []).


% Exercise 5.4
% member(X, Candidates), \+ member(X, RuledOut).


% Exercise 5.5
set_difference([X|Set1], Set2, [X|SetDiff]) :-
  \+ member(X, Set2),
  !,
  set_difference(Set1, Set2, SetDiff).

set_difference([X|Set1], Set2, SetDiff) :-
  member(X, Set2),
  !,
  set_difference(Set1, Set2, SetDiff).

set_difference([], _, []).


% Exercise 5.6
unifiable([X|L1], T, L2) :-
  \+ X = T,
  !,
  unifiable(L1, T, L2).

unifiable([X|L1], T, [X|L2]) :-
  !,
  unifiable(L1, T, L2).

unifiable([], _, []).
