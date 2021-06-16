function []=LinProgPlot(c,A,b,type)
if ~exist('type','var')|type=='p'
    if size(c)~=2 disp('LinProgPlot error: variables are not two!');return; end
    strtitle = 'Primal Feasible Region';
elseif type=='d'
    if size(b)~=2 disp('LinProgPlot error: constraints are not two!');return; end
    strtitle = 'Dual Feasible Region';
    Ad=-A';bd=-c';cd=b';
    A=Ad;b=bd;c=-cd; %we solve the dual problem as a standard max problem
else disp('LinProgPlot error: primal or dual? (enter ''p'' or ''d'')');return;    
end

lb=zeros(1,length(c));
[x,fval,exitflag,output,lambda]=linprog(-c,A,b,[],[],lb,[]);
figure;
m=size(b);
yintercepts=[];
xintercepts=[];
for (i=1:m)
yintercepts=[yintercepts b(i)/A(i,2)];
xintercepts=[xintercepts b(i)/A(i,1)];
end
xbound=max(xintercepts)*1.4;
ybound=max(yintercepts)*1.4;
title(strtitle,'FontSize',18);
hold on
x1=[0:xbound/7:xbound];
%y1=[0:ybound/7:ybound];
a={};
for (i=1:m)
    color=rand(1,3)*.8;
    if A(i,2)>0 %below the line
        y1=b(i)/A(i,2)-A(i,1)/A(i,2)*x1;
        y2=0*x1;
        patch('Xdata',[x1 fliplr(x1)],'Ydata',[y1 fliplr(y2)],'EdgeColor',color,'EdgeAlpha',1,'FaceColor',color+.2,'FaceAlpha',.3,'LineWidth',2); 
        %plot(x1,y1,'color',color,'LineWidth',2);
    else
        %above the line
        y2=ybound+0*x1;
        y1=b(i)/A(i,2)-A(i,1)/A(i,2)*x1;
        patch('Xdata',[x1 fliplr(x1)],'Ydata',[y2 fliplr(y1)],'EdgeColor',color,'EdgeAlpha',1,'FaceColor',color+.2,'FaceAlpha',.3,'LineWidth',2); 
        %plot(x1,y1,'color',color,'LineWidth',2);
    end
        a{end+1} = sprintf('constraint %d',i);
end

isoprofit=-fval/c(2)-c(1)/c(2)*x1;
plot(x1,isoprofit,'--r','LineWidth',2);
a{end+1} = 'isoprofit';
lgd=legend(a);
lgd.FontSize=12;
xlabel('x_1','FontSize',12)
ylabel('x_2','FontSize',12)
%set(gca,'XTick',x1);
%set(gca,'YTick',y1);
axis([0 xbound 0 ybound]);
hold off
end


