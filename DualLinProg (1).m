function []=DualLinProg(c,A,b)
%DualLinProg(c,A,b) solves the dual optimization problem of the problem
%   max cx 
%   sub Ax <= b, x>=0
%that is, the problem
%   min b'y
%   sub A'y>= c', y>=0

%% Dual with changed constraint signs
Ad=-A';
cd=b';
bd=-c';
%% Solution Dual
lbd=zeros(1,length(cd));
[xd,fvald,exitflagd,outputd,lambdad]=linprog(cd,Ad,bd,[],[],lbd,[]);

%% Displaying solutions
disp('Solution Dual')
xd
disp('Optimal Profit Dual')
profit=fvald;
profit
disp('Shadow Prices Dual')
shadowpricesdual=lambdad.ineqlin;
shadowpricesdual
disp('Reduced Costs Dual')
reducedcostsdual=lambdad.lower;
reducedcostsdual
