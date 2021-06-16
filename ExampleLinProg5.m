close all
clear all
clc
c=[450 300 ];
A=[ 6 5
    4 3
    1 0.2];
b=[70 81 5]';


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

