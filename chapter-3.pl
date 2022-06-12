% 3.2.2 conc
conc([], L, L).

conc([X|L1], L2, [X|L3]) :-
  conc(L1, L2, L3).


% Exercise 3.1
% (a) conc(L1, [_, _, _], L).
% (b) conc(L1, [_, _, _], L), conc([_, _, _], L2, L1).


% Exercise 3.2
% (a)
lasta(X, L) :-
  conc(_, [X], L).


% (b)
lastb(X, [_|L]) :-
  lastb(X, L).

lastb(X, [X]).


% Exercise 3.3
evenlength([_|L]) :-
  oddlength(L).

evenlength([]).

oddlength([_|L]) :-
  evenlength(L).


% Exercise 3.4
rev([X|L1], L2) :-
  rev(L1, L),
  append(L, [X], L2).

rev([], []).


% Exercise 3.5
palindrome(L) :-
  rev(L, L).


% Exercise 3.6
shift([X|L1], L2) :-
  conc(L1, [X], L2).

shift([], []).


% Exercise 3.7
means(0, zero).
means(1, one).
means(2, two).
means(3, three).
means(4, four).
means(5, five).
means(6, six).
means(7, seven).
means(8, eight).
means(9, nine).


translate([X|L1], [T|L2]) :-
  means(X, T),
  translate(L1, L2).

translate([], []).


% Exercise 3.8
subset([X|L], [X|S]) :-
  subset(L, S).

subset([_|L], S) :-
  subset(L, S).

subset([], []).


% Exercise 3.9
dividelist([X, Y|L], [X|L1], [Y|L2]) :-
  dividelist(L, L1, L2).

dividelist([X], [X], []).

dividelist([], [], []).


% Exercise 3.10
% state(
%   MonkeyHorizontalPosition,
%   MonkeyVerticalPosition,
%   BoxPosition,
%   HasBanana
% ).
move(
  state(middle, onbox, middle, hasnot),
  grasp,
  state(middle, onbox, middle, has)
).

move(state(P, onfloor, P, H), climb, state(P, onbox, P, H)).

move(state(P1, onfloor, P1, H), push(P1, P2), state(P2, onfloor, P2, H)).

move(state(P1, onfloor, B, H), walk(P1, P2), state(P2, onfloor, B, H)).


canget(state(_, _, _, has), []).

canget(State1, [Move|Actions]) :-
  move(State1, Move, State2),
  canget(State2, Actions).


% Exercise 3.11
flat([X1|L1], L) :-
  list(X1),
  flat(X1, X2),
  flat(L1, L2),
  conc(X2, L2, L).

flat([X|L1], [X|L2]) :-
  nonlist(X),
  flat(L1, L2).

flat([], []).


nonlist(X) :-
  atomic(X),
  X \== [].

nonlist(X) :-
  var(X).


% Exercise 3.12
:- op(300, xfx, plays).
:- op(200, xfy, and).

% write_canonical(jimmy plays football and squash).
% plays(jimmy, and(football, squash))

% write_canonical(susan plays tennis and basketball and volleyball).
% plays(susan, and(tennis, and(basketball, volleyball)))


% Exercise 3.13
:- op(300, xfx, was).
:- op(200, xfy, of).
:- op(100, fx, the).


diana was the secretary of the department.


% Exercise 3.14
t(0 + 1, 1 + 0).

t(X + 0 + 1, X + 1 + 0).

t(X + 1 + 1, Z) :-
  t(X + 1, X1),
  t(X1 + 1, Z).

% (a) ?- t(0 + 1, A).
% A = 1 + 0.

% (b) ?- t(0 + 1 + 1, B).
% B = 1 + 1 + 0

% (c) ?- t(1 + 0 + 1 + 1 + 1, C).
% C = 1 + 1 + 1 + 1 + 0

% (d) ?- t(D, 1 + 1 + 1 + 0).
% D = 1 + 1 + 0 + 1 ;
% D = 1 + 0 + 1 + 1 ;
% D = 0 + 1 + 1 + 1 ;
% doesn't terminate


% Exercise 3.15
:- op(300, xfx, in).
:- op(300, xfx, gives).
:- op(200, fx, [concatenating, deleting]).
:- op(100, xfx, [and, from]).


in(X, L) :-
  member(X, L).


gives(concatenating(and(L1, L2)), L3) :-
  conc(L1, L2, L3).

gives(deleting(from(L1, X)), L2) :-
  delete(X, L1, L2).


% Exercise 3.16
max(X, Y, X) :-
  X >= Y.

max(X, Y, Y) :-
  Y >= X.


% Exercise 3.17
maxlist([X, Y|L], Max) :-
  maxlist([Y|L], M),
  max(X, M, Max).

maxlist([X], X).


% Exercise 3.18
sumlist([X|L], Sum) :-
  sumlist(L, S),
  Sum is X + S.

sumlist([], 0).


% Exercise 3.19
ordered([X, Y|L]) :-
  X =< Y,
  ordered([Y|L]).

ordered([_]).

ordered([]).


% Exercise 3.20
subsum([X|L], S, [X|Sub]) :-
  subsum(L, S1, Sub),
  S is X + S1.

subsum([_|L], S, Sub) :-
  subsum(L, S, Sub).

subsum([], 0, []).


% Exercise 3.21
tween(From, To, From) :-
  From =< To.

tween(From, To, X) :-
  From =< To,
  Next is From + 1,
  tween(Next, To, X).


% Exercise 3.22
:- op(900, fx, if).
:- op(800, xfy, then). % needs to be greater than 700 (>'s precedence)
:- op(700, xfx, else).
:- op(600, xfx, :=).

if(then(X > Y, else(Z := V, Z := _))) :-
  X > Y,
  Z = V.

if(then(X > Y, else(Z := _, Z := V))) :-
  X =< Y,
  Z = V.
