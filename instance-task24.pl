% ---------------------------------------------------------------------
%  ----- Informatics 2D - 2015/16 - Second Assignment - Planning -----
% ---------------------------------------------------------------------
%
% Write here you matriculation number (only - your name is not needed)
% Matriculation Number: s_______
%
%
% ------------------------- Problem Instance --------------------------
% This file is a template for a problem instance: the definition of an
% initial state and of a goal. 

% debug(on).	% need additional debug information at runtime?



% --- Load domain definitions from an external file -------------------

:- ['domain-task21.pl'].		% Replace with the domain for this problem




% --- Definition of the initial state ---------------------------------
agent(a).
car(c1).
car(c2).
at(a,d,s0).
at(c1,pI,s0).
at(c2,d,s0).
parked(c1,s0).
location(p).
location(pI).
location(d).
connectWith(d,pI).
connectWith(pI,d).
connectWith(pI,p).
connectWith(p,pI).





% --- Goal condition that the planner will try to reach ---------------

goal(S) :- at(a,d,S), parked(c2,S),at(c2,pI,S),delivered(c1,S).					% fill in the goal definition




% ---------------------------------------------------------------------
% ---------------------------------------------------------------------
