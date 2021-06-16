close all
clear all
clc
c=[6 6];
A=[ 10 -4
    9 5
    -9 5];
b=[27 38 19]';


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
LinProgPlot(c,A,b,'p')
