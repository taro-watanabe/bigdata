close all
clear all
% This subtoutine is a script. It has been used in class to illustrate the
% concepts. On the exam you will be asked to use the subroutine
% called DualLinProg.m.  DualLinProg.m is, instead, a function. 
%% Input
% Coefficients
c=[1 2];
% LHS matrix A
A=[1 4
   2 1];
% RHS
b=[2 
   1];
%% Solution Primal
[x,fval,exitflag,output,lambda]=linprog(-c,A,b,[],[],[0 0],[]);
disp('Solution Primal')
x
disp('Optimal value Primal')
-fval
% Feasible Region Primal
%% Plot
x1=[0:0.1:10];
y1=b(1)/A(1,2)-A(1,1)/A(1,2)*x1;
y2=b(2)/A(2,2)-A(2,1)/A(2,2)*x1;
isoprofit=-fval/c(2)-c(1)/c(2)*x1;
plot(x1,y1,x1,y2,x1,isoprofit,'--','LineWidth',2)
lgd=legend('Constraint 1','Constraint 2','Isoprofit');
title('Feasible Region Plot','FontSize',24)
lgd.FontSize=24;
xlabel('x_1','FontSize',24)
ylabel('x_2','FontSize',24)
axis([0 2 0 2])

a1=-A(1,1)/A(1,2);
a2=-A(2,1)/A(2,2);
b1=b(1)/A(1,2);
b2=b(2)/A(2,2);

a1l=num2str(a1);
a2l=num2str(a2);
b1l=num2str(b1);
b2l=num2str(b2);
bIl=num2str(-fval/c(2));
aIl=num2str(-c(1)/c(2));

disp('Lines Primal')
L1=strcat('x2=',a1l,'x1+',b1l)
L2=strcat('x2=',a2l,'x1+',b2l)

IsoprofitPrimal=strcat('x2=',aIl,'x1+',bIl)

%% Dual
Ad=-A';
cd=b;
bd=-c;
%% Solution Dual
[xd,fvald,exitflagd,outputd,lambdad]=linprog(cd,Ad,bd,[],[],[0 0],[]);
disp('Solution Dual')
xd
disp('Optimal Value Dual')
fvald

%% Plot
x1=[0:0.1:10];
bdd=-bd;
Add=-Ad;
cdd=-cd;
y1=bdd(1)/Add(1,2)-Add(1,1)/Add(1,2)*x1;
y2=bdd(2)/Add(2,2)-Add(2,1)/Add(2,2)*x1;
isoprofit=-fvald/cdd(2)-cdd(1)/cdd(2)*x1;
figure
plot(x1,y1,x1,y2,x1,isoprofit,'--','LineWidth',2)
lgd=legend('Constraint 1','Constraint 2','Isoprofit');
title('Dual Feasible Region','FontSize',24)
lgd.FontSize=24;
xlabel('y_1','FontSize',24)
ylabel('y_2','FontSize',24)
axis([0 2 0 2])
%%
a1dd=-Add(1,1)/Add(1,2);
a2dd=-Add(2,1)/Add(2,2);
b1dd=bdd(1)/Add(1,2);
b2dd=bdd(2)/Add(2,2);

a1ldd=num2str(a1dd);
a2ldd=num2str(a2dd);
b1ldd=num2str(b1dd);
b2ldd=num2str(b2dd);
bIldd=num2str(-fvald/cdd(2));
aIldd=num2str(-cdd(1)/cdd(2));

L1dual=strcat('y=',a1ldd,'x+',b1ldd)
L2dual=strcat('y=',a2ldd,'x+',b2ldd)
Isoprofitdual=strcat('y=',aIldd,'x+',bIldd)
