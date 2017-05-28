% ---------------------------------------------------------------------
%  ----- Informatics 2D - 2015/16 - Second Assignment - Planning -----
% ---------------------------------------------------------------------
%
% Write here you matriculation number (only - your name is not needed)
% Matriculation Number: s1575257
%
%
% ------------------------- Problem Instance --------------------------
% This file is a template for a problem instance: the definition of an
% initial state and of a goal. 

debug(on).	% need additional debug information at runtime?



% --- Load domain definitions from an external file -------------------

:- ['domain-task21.pl'].		% Replace with the domain for this problem




% --- Definition of the initial state ---------------------------------
agent(a).
car(c).
at(a,pl,s0).
at(c,pl,s0).
location(p).
location(pl).
location(d).
connectWith(d,pl).
connectWith(pl,d).
connectWith(pl,p).
connectWith(p,pl).







% --- Goal condition that the planner will try to reach ---------------

goal(S) :- parked(c,S),at(a,d,S),at(c,pl,S).					% fill in the goal definition




% ---------------------------------------------------------------------
% ---------------------------------------------------------------------
