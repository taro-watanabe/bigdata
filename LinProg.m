function []=LinProg(c,A,b)
%LinProg(c,A,b) solves the optimization problem 
%   max cx 
%   sub Ax <= b, x>=0

%% Solution Primal
lb=zeros(1,length(c));
[x,fval,exitflag,output,lambda]=linprog(-c,A,b,[],[],lb,[]);

%% Displaying solutions
disp('Solution')
x
disp('Optimal Profit')
profit=-fval
disp('Shadow Prices')
shadowprices=lambda.ineqlin
disp('Reduced Costs')
reducedcosts=lambda.lower

