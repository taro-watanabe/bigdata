close all
clear all
clc
%% Input
%Coefficients
c=[3 4];
% Matrix
A=[3 5 
   7 5];
%RHS 
b=[4 
   7];

%% Solution Primal
[x,fval,exitflag,output,lambda]=linprog(-c,A,b,[],[],[0 0],[]);
 disp('Optimal Plan')
 x
 disp('Objective Function Optimized Value')
 -fval

%% Plot Primal
x1=[0:0.1:10];
y1=b(1)/A(1,2)-A(1,1)/A(1,2)*x1;
y2=b(2)/A(2,2)-A(2,1)/A(2,2)*x1;
isoprofit=-fval/c(2)-c(1)/c(2)*x1;
figure
plot(x1,y1,x1,y2,x1,isoprofit,'--','LineWidth',2)
lgd=legend('Constraint 1','Constraint 2','Isoprofit');
title('Primal Feasible Region','FontSize',24);
lgd.FontSize=18;
xlabel('x_1','FontSize',24)
ylabel('x_2','FontSize',24)
axis([0 2 0 2]);

%% Dual
Ad=-A';
cd=b;
bd=-c;


%% Solution Dual
[xd,fvald,exitflagd,outputd,lambdad]=linprog(cd,Ad,bd,[],[],[0 0],[]);
disp('Dual Optimal Plan:')
xd
disp('Dual Objective Function Optimized Value:')
fd=fvald

%% Plot Dual
x1d=[0:0.1:3];
y1d=bd(1)/Ad(1,2)-Ad(1,1)/Ad(1,2)*x1d;
y2d=bd(2)/Ad(2,2)-Ad(2,1)/Ad(2,2)*x1d;
isoprofitd=fvald/cd(2)-cd(1)/cd(2)*x1d;
figure
plot(x1d,y1d,x1d,y2d,x1d,isoprofitd,'--','LineWidth',2)
lgd=legend('Constraint 1','Constraint 2','Isoprofit');
title('Dual Feasible Region','FontSize',24)
lgd.FontSize=24;
xlabel('y_1','FontSize',24)
ylabel('y_2','FontSize',24)
axis([0 2 0 2])


%% Allowable ranges coefficients
a1=A(1,1)/A(1,2);
a2=A(2,1)/A(2,2);
b1=b(1)/A(1,2);
b2=b(1)/A(1,2);

a1l=num2str(a1);
a2l=num2str(a2);
b1l=num2str(b1);
b2l=num2str(b2);
bIl=num2str(-fval/c(2));
aIl=num2str(-c(1)/c(2));

c1bound1=a1*c(2);
c1bound2=a2*c(2);

c2bound1=(1/a1)*c(1);
c2bound2=(1/a2)*c(1);

disp('Allowable Changes Coefficients')
c1Allowable1=c1bound1-c(1)
c1Allowable2=c1bound2-c(1)
c2Allowable1=c2bound1-c(2)
c2Allowable2=c2bound2-c(2)

%% Allowble Ranges Shadow Prices
Ad=-Ad;
bd=-bd;

a1d=Ad(1,1)/Ad(1,2);
a2d=Ad(2,1)/Ad(2,2);
b1d=bd(1)/Ad(1,2);
b2d=bd(1)/Ad(1,2);

a1ld=num2str(a1d);
a2ld=num2str(a2d);
b1ld=num2str(b1d);
b2ld=num2str(b2d);


c1bound1d=a1d*cd(2);
c1bound2d=a2d*cd(2);

c2bound1d=(1/a1d)*cd(1);
c2bound2d=(1/a2d)*cd(1);

%%
disp('Allowable Changes on Shadow Prices')
disp('First Constraint')
b1Allowable1d=c1bound1d-cd(1)
b1Allowable2d=c1bound2d-cd(1)

disp('Second Constraint')
b2Allowable1d=c2bound1d-cd(2)
b2Allowable2d=c2bound2d-cd(2)

