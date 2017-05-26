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

% debug(on).	% need additional debug information at runtime?



% --- Load domain definitions from an external file -------------------

:- ['domain-task21.pl'].		% Replace with the domain for this problem




% --- Definition of the initial state ---------------------------------
agent(a).
at(a,p,s0).
location(p).
location(pI).
location(d).
connectWith(d,pI).
connectWith(pI,d).
connectWith(pI,p).
connectWith(p,pI).





% --- Goal condition that the planner will try to reach ---------------

goal(S) :-at(a,d,S).				% fill in the goal definition




% ---------------------------------------------------------------------
% ---------------------------------------------------------------------