close all
clear all
clc
c=[450 300 220];
A=[ 6 5 3
    4 3 2
    1 0 -2];
b=[70 81 0]';


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
help LinProgSensitivity
LinProgSensitivity(c,A,b)

