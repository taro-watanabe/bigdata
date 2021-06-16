function []=LinProgSensitivity(c,A,b)
%Given the optimization problem 
%   max cx 
%   sub Ax <= b, x>=0
%LinProgSensitivity(c,A,b) solves the optimization problem and
%computes the allowable decrease and increase
%for each coefficient c and each constraint value b.

%%Computing n=number of vars, m=number of slack vars from original problem
n=length(c);
m=length(b);

%%Solving the original problem
[x,fval,exitflag,output,lambda]=linprog(-c,A,b,[],[],zeros(1,n),[]);

%%complete matrix AA=(A|I_m) for all the n+m vars
AA=[A eye(m)];
%%complete vector of coefficients cc=(c|0_m) for all the n+m vars
cc=[c zeros(1,m)];

%%search of non basic vars:
%we assume that the feasible set is a convex symplex.
%Then if at the point of max there are more than n active constraints
%any choice of n of them gives generally an optimal dictionary.
%Moreovere, if at the point of max there are less than n active
%constraints, then some original variables are zero at the point of max
%and the corresponding coefficient of the objective function is negative:
%we add those variables to the non basic vars.
idxN=n+find(round([b-A*x]',4)==0);
if length(idxN)>n
    idxN=idxN(:,1:n);
end
if length(idxN)<n 
    idxN=[find(round(x',4)==0) idxN];
end
idxB=setdiff(1:n+m,idxN); %complement set of idxN

%%matrix AA decomposed into basic and nonbasic part
B=AA(:,idxB);N=AA(:,idxN);
%%vector cc decomposed into basic and nonbasic part
cB=cc(:,idxB);cN=cc(:,idxN);

%%computing and storing inv(B)
%if there is an error in the computation of inv(B)
%or if some b's in the opt dictinary are negative (not feasible)
%or if some c's in the opt dictionary are posifive (the max can increase)
%then the dictionary computed is not optimal, 
try
    invB=inv(B);
catch
   disp('LinProgSensitivity error: I cannot find an optimal dictionary');
   return
end
if min(invB*b<0) %each b's in the opt dictinary are >=0
    disp('LinProgSensitivity error: I cannot find an optimal dictionary');
   return
end
if max(-cB*invB*N+cN>0) %each c's in the opt dictinary are <=0
    disp('LinProgSensitivity error: I cannot find an optimal dictionary');
   return
end
%%at this point we are sure that we have an optimal dictionary!

%%Allowable decrease/increase for the coefficients c's
disp('Allowable decrease/increase for the coefficients');
AllowableDecrIncrCoeff=[];
for i=1:1:n
    %%setting 1 to the i-th component of deltac coeff
    deltac=[zeros(1,n+m)];
    deltac(:,i)=1;
    deltacB=deltac(:,idxB);
    deltacN=deltac(:,idxN);
    
    deltazN=deltacB*(invB*N)-deltacN;
    zN=cB*(invB*N)-cN; %
    
    %%imposing Nz+t*deltaNz >= 0 and solving w.r.t. var t (p. 113)
    UB = max(-deltazN./zN);
    if (UB<=1e-15) %instead of 0 we set 1e-15 for rounding errors
        UB=Inf;
    else UB=1/UB;
    end
    LB = min(-deltazN./zN);
    if (LB>=-1e-15) %instead of 0 we set -1e-15 for rounding errors
        LB=-Inf;
    else LB=1/LB;
    end
    AllowableDecrIncrCoeff=[AllowableDecrIncrCoeff;[LB UB]];
end
AllowableDecrIncrCoeff

%%Allowable decrease/increase for the constraints b's
disp('Allowable decrease/increase for the constraints');
AllowableDecrIncrConstr=[];
xdB=invB*b;
for i=1:1:m
    %%setting 1 to the i-th component of deltab coeff
    deltab=[zeros(1,m)]';
    deltab(i,:)=1;
    deltaxB=invB*deltab;
    %%imposing Bx+t*deltaBx >= 0 and solving w.r.t. var t (p. 115)
    UB = max(-deltaxB./xdB);
    if (UB<=1e-15) %instead of 0 we set 1e-15 for rounding errors
        UB=Inf;
    else UB=1/UB;
    end
    LB = min(-deltaxB./xdB);
    if (LB>=-1e-15) %instead of 0 we set -1e-15 for rounding errors
        LB=-Inf;
    else LB=1/LB;
    end
   AllowableDecrIncrConstr=[AllowableDecrIncrConstr;[LB UB]];
end
AllowableDecrIncrConstr

