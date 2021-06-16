close all
clear all
clc
%% Input
c=[300 350];
A=[20 10;
   4 7;
   -1 -1;
   -3 1];
b=[90
   28
   -1
    0];

% solving the linear problem
LinProg(c,A,b)

% Computing Allowed variation range of coefficients/constraints
LinProgSensitivity(c,A,b)

% there are only 2 vars: we can perform a plot
LinProgPlot(c,A,b)

