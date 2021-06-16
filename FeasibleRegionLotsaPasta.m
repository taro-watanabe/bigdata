close all
clear all
clc
%% Input
c=[300 350];
A=[20 10; 4 7; -1 -1; -3 -1];
b=[90 28 -1 0];

%% Solution
[xhat, fval]=linprog(-c,A,b,[],[],[0 0],[]);

%% Plot
x1=[0:0.1:10];
y1=b(1)/A(1,2)-A(1,1)/A(1,2)*x1;
y2=b(2)/A(2,2)-A(2,1)/A(2,2)*x1;
y3=b(3)/A(3,2)-A(3,1)/A(3,2)*x1;
y4=b(4)/A(4,2)+A(4,1)/A(4,2)*x1;
isoprofit=-fval/c(2)-c(1)/c(2)*x1;
plot(x1,y1,x1,y2,x1,y3,x1,y4,x1,isoprofit,'--','LineWidth',2)
lgd=legend('Constraint 1','Constraint 2','Constrain 3','Constraint 4','Isoprofit')
title('Feasible Region Plot','FontSize',24)
lgd.FontSize=24;
xlabel('x_1','FontSize',24)
ylabel('x_2','FontSize',24)
axis([0 10 0 10])
%%
a1=A(1,1)/A(1,2);
a2=A(2,1)/A(2,2);
b1=b(1)/A(1,2);
b2=b(2)/A(2,2);

a1l=num2str(a1);
a2l=num2str(a2);
b1l=num2str(b1);
b2l=num2str(b2);
bIl=num2str(-fval/c(2));
aIl=num2str(-c(1)/c(2));

disp('Solution')
x1hat=strcat('x1*=',num2str(xhat(1)))
x2hat=strcat('x2*=',num2str(xhat(2)))
disp('Constraint Lines')
L1=strcat('x2=',a1l,'x1+',b1l);
L2=strcat('x2=',a2l,'x1+',b2l);

Isoprofit=strcat('x2=',aIl,'x1+',bIl)


