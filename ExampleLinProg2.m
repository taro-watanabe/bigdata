%%Example at page 113 chapter 7.1 of [Vanderbei]

close all
clear all
clc
%% Input
A=[2 3 1; 4 1 2; 3 4 2];
b=[5 11 8]';
c=[5 4 3];
%%in this example: basic vars x1,x3,x5; non basic vars x2,x4,x6

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






