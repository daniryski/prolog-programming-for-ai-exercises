% Figure 4.1 Structuring information about the family.
family(
  person(tom, fox, date(7, may, 1960), works(bbc, 15200)),
  person(ann, fox, date(9, may, 1961), unemployed),
  [ person(pat, fox, date(5, may, 1983), unemployed),
    person(jim, fox, date(5, may, 1983), unemployed)]).


child(X) :-
  family(_, _, Children),
  member(X, Children).


dateofbirth(person(_, _, Date, _), Date).


% Exercise 4.1
% (a) family(person(_, Family, _), _, []).
% (b) child(person(Name, Surname, _, works(_, _))).
% (c) family(person(_, Family, unemployed), person(_, _, works(_, _)), _).


% (d) (Note: doesn't take in mind days, and months)
% family(Husband, Wife, Children),
%   dateofbirth(Husband, date(_, _, HusbandYear)),
%   dateofbirth(Wife, date(_, _, WifeYear)),
%   abs(HusbandYear - WifeYear) >= 15,
%   member(Child, Children).


% Exercise 4.2
twins(X, Y) :-
  family(_, _, Children),
  member(X, Children),
  member(Y, Children),
  X \= Y,
  dateofbirth(X, D),
  dateofbirth(Y, D).


% Exercise 4.3
nth_member(N, [_|L], X) :-
  N1 is N - 1,
  nth_member(N1, L, X).

nth_member(1, [X|_], X).


% Exercise 4.4
% Because every path starting, and ending in the same state accepts some input other than the empty string.


% Exercise 4.5
accepts(State, [X|Rest], N) :-
  N > 0,
  trans(State, X, State1),
  N1 is N - 1,
  accepts(State1, Rest, N1).

accepts(State, Input, N) :-
  N > 0,
  silent(State, State1),
  N1 is N - 1,
  accepts(State1, Input, N1).

accepts(State, [], _) :-
  final(State).


% Exercise 4.6
% The order of alternatives is defined by member(Y, [1, 2, 3, 4, 5, 6, 7, 8]).
% Changing the list will change the order of alternatives.


% Exercise 4.7
% (a)
jump(X1/Y1, X2/Y2) :-
  ( member(X, [X1 - 1, X1 + 1]),
    member(Y, [Y1 - 2, Y1 + 2])
  ; member(X, [X1 - 2, X1 + 2]),
    member(Y, [Y1 - 1, Y1 + 1])
  ),
  X2 is X,
  Y2 is Y,
  between(1, 8, X2),
  between(1, 8, Y2).


% (b)
knightpath([S1, S2|Rest]) :-
  jump(S1, S2),
  knightpath([S2|Rest]).

knightpath([_]).

knightpath([]).


% (c)
% Path = [2/1, _, 5/4, _, _/8], knightpath(Path).
