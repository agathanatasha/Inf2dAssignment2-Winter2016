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
:- multifile name/#, name/#, name/#, ...
:- multifile 
agent(a),
location(pl),
location(d),
connectWith(d,pl),
connectWith(pl,d),
connectWith(pl,p),
connectWith(p,pl),
at(a,_,_),
car(Y),
at(Y,_,_).




% --- Primitive control actions ---------------------------------------
% this section defines the name and the number of parameters of the
% actions available to the planner
%
% primitive_action( dosomething(_,_) ).	% underscore means `anything'
primitive_action(move(_,_)).
primitive_action(park(_)).
primitive_action(deliver(_)).
primitive_action(drive(_,_,_)).



% --- Precondition for primitive actions ------------------------------
% describe when an action can be carried out, in a generic situation S
%
% poss( doSomething(...), S ) :- preconditions(..., S).
poss(move(L1,L2),S) :- agent(a) , at(a,L1,S), connectWith(L1,L2), location(L1), location(L2).
poss(park(X),S) :- agent(a), at(a,pl,S), car(X), at(X,pl,S),location(pl).
poss(deliver(X),S) :- agent(a), at(a,p,S), car(X), at(X,p,S),location(p).
poss(drive(X,L1,L2),S) :- agent(a), at(a,L1,S), car(X), at(X,L1,S), connectWith(L1,L2),location(L1),location(L2).


% --- Successor state axioms ------------------------------------------
% describe the value of fluent based on the previous situation and the
% action chosen for the plan. 
%
% fluent(..., result(A,S)) :- positive; previous-state, not(negative)
%at(X,Location,result(A,S)) :-
	%((A = move(_, Location),agent(X)); (A = drive(_,_,Location),agent(X))) ;
	%(at(X,Location,S), (not(A = move(_,_)); not(A = drive(, at(Y,Location,result(A,S)) _,_,_)))).
%at(X,Location,result(A,S)) :-
        %(A = drive(X,_,Location),car(X));
        %at(X,Location,S), not(A = drive(_,_,_)).
at(X,Location,result(A,S)):-
        ((A = move(_,Location),agent(X));
        (at(X,Location,S), not(A = move(_,_)), not(A = drive(_,_,_))));
        ((A = drive(X,_,Location), car(X)); 
        (at(X,Location,S), not(A = drive(_,_,_))));
        ((A = drive(_,_,Location), agent(X)); 
        (at(X,Location,S), not(A = move(_,_)), not(A = drive(_,_,_)))).

parked(X, result(A,S)) :-
	(A = park(X), car(X));
	(parked(X,S), not(A = park(_))).
delivered(X,result(A,S)):-
	A = deliver(X);
	(delivered(X,S), not(A = deliver(_))).




% ---------------------------------------------------------------------
% ---------------------------------------------------------------------
