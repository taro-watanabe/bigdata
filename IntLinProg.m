function []=IntLinProg(c,A,b)
%IntLinProg(c,A,b) searches integer solutions 
%of the optimization problem 
%   max cx 
%   sub Ax <= b, x>=0

lb=zeros(1,length(c));
intcon=1:length(c);
[x,fval]=intlinprog(-c,intcon,A,b,[],[],lb,[]);

%% 
disp('Solution')
x
disp('Optimal Profit')
profit=-fval


