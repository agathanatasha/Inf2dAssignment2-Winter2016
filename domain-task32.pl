% ---------------------------------------------------------------------
%  ----- Informatics 2D - 2015/16 - Second Assignment - Planning -----
% ---------------------------------------------------------------------
%
% Write here you matriculation number (only - your name is not needed)
% Matriculation Number: s1575257
%
%
% ------------------------- Domain Definition -------------------------
% This file describes a planning domain: a set of predicates and
% fluents that describe the state of the system, a set of actions and
% the axioms related to them. More than one problem can use the same
% domain definition, and therefore include this file


% --- Cross-file definitions ------------------------------------------
% marks the predicates whose definition is spread across two or more
% files
%
% :- multifile name/#, name/#, name/#, ...
:- multifile agent(a), location(d), location(pI),location(p), connectWith(d,pI), connectWith(pI,p),car(c),at(x,y,s),parked(c,s),delivered(c,s),dirty(c,s),clean(c,s), stored(k,s), holding(k,s),empty(a).




% --- Primitive control actions ---------------------------------------
% this section defines the name and the number of parameters of the
% actions available to the planner
%
% primitive_action( dosomething(_,_) ).	% underscore means `anything'
primitive_action(move(_,_)).
primitive_action(park(_)).
primitive_action(deliver(_)).
primitive_action(drive(_,_,_)).
primitive_action(cleaning(_)).
primitive_action(grab(_)).
primitive_action(store(_)).
primitive_action(returnKey(_)).





% --- Precondition for primitive actions ------------------------------
% describe when an action can be carried out, in a generic situation S
%
% poss( doSomething(...), S ) :- preconditions(..., S).
poss(move(L1,L2),S) :- agent(a) , at(a,L1,S), connectWith(L1,L2), location(L1), location(L2).
poss(park(X),S) :- agent(a), at(a,pI,S), car(X), at(X,pI,S),key(Y),keyOf(Y,X).
poss(deliver(X),S) :- agent(a), at(a,p,S), car(X), at(X,p,S),clean(X,S),empty(a,S).
poss(drive(X,L1,L2),S) :- agent(a), at(a,L1,S), car(X), at(X,L1,S), connectWith(L1,L2),location(L1),location(L2),key(Y),keyOf(Y,X).
poss(cleaning(X),S) :- agent(a),at(a,pI,S),car(X),at(X,pI,S),dirty(X,S),key(Y),keyOf(Y,X).
poss(grab(X),S) :- key(X), agent(a), at(a,pI,S), keyOf(X,Y),parked(Y,S),at(Y,pI,S),empty(a,S).
poss(store(X),S) :- key(X), agent(a), at(a,pI,S), car(Y), keyOf(X,Y),parked(Y,S),at(Y,pI,S),holding(X,S).
poss(returnKey(X),S):- key(X), agent(a), at(a,p,S), car(Y), keyOf(X,Y),at(Y,p,S),holding(X,S).





% --- Successor state axioms ------------------------------------------
% describe the value of fluent based on the previous situation and the
% action chosen for the plan. 
%
% fluent(..., result(A,S)) :- positive; previous-state, not(negative)
at(X,Location,result(A,S)) :-
	((A = move(_, Location),agent(X)); (A = drive(_,_,Location),agent(X))) ;
	at(X,Location,S), (not(A = move(_,_)); not(A = drive(_,_,_))).
at(X,Location,result(A,S)) :-
        (A = drive(X,_,Location),car(X));
        at(X,Location,S), not(A = drive(_,_,_)).

parked(X, result(A,S)) :-
	A = park(X);
	parked(X,S), not(A = park(_)).
delivered(X,result(A,S)) :-
	A = deliver(X);
	delivered(X,S), not(A = deliver(_)).
	
dirty(X,result(A,S)) :- 
        A = park(X);
        parked(X,S), not(A = park(_)).
clean(X,result(A,S)) :-
        A = cleaning(X);
        clean(X,S), not(A = cleaning(_)).
stored(X,result(A,S)) :-
        A = store(X);
        stored(X,S), not(A = stored(_,_)).
empty(X,result(A,S)) :-
        (A = stored(_),agent(X));(A = returnKey(_),agent(X));
        empty(X,S),(not(A = stored(_)); not(A = returnKey(_))).
holding(X,result(A,S)) :-
        (A = grab(_),agent(X));
        holding(_,S), (not(A = store(_)); not(A = returnKey(_))).

% ---------------------------------------------------------------------
% ---------------------------------------------------------------------
