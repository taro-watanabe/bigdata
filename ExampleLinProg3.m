close all
clear all
clc
c=[3 4]
% Matrix
A=[3 5 
   7 5]
%RHS 
b=[4 
   7]

% solving the linear problem
% max c x
% sub A x <=b
help LinProg
LinProg(c,A,b)


% solving the dual problem of 
% max c x
% sub A x <=b
help DualLinProg
DualLinProg(c,A,b)

% Computing Allowed variation range of coefficients/constraints
LinProgSensitivity(c,A,b)

% there are only 2 vars: we can perform a plot
LinProgPlot(c,A,b)

% there are only 2 constraints: we can perform a plot of the dual problem
LinProgPlot(c,A,b,'d')
