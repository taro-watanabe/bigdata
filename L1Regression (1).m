function [coeffs1]=L1Regression(A,b,train)
%L1Regression(A,b,train) 
%reads a sample consisting of input vars and corresponding output
%(row of A and corresponding value of b) and %computes 
%the coefficients of the input vars which minimizes 
%the sum of of absolute errors (L1 regression)
%over the first part of sample data
%(train part determined by the percent value 'train').
%
%The program returns the coefficients and display RMSE, MAD, 
%R-squared of the prediction over the second part of sample data
%(test part, the part in the data which is not train part).
%
%The 'train' parameter is optional (default=0.7).

if ~exist('train','var')
    train=0.7;
end
% Subdividing data into Train Data and Test data
ntrain=round(size(A,1)*train,0);
ntest=size(A,1)-ntrain;
Aenl=[ones(size(A,1),1) A]; %enlarged A with first column equal to 1
y=b(1:ntrain,1);
X=Aenl(1:ntrain,:);
Xtest=Aenl(ntrain+1:end,:);
ytest=b(ntrain+1:end,:);

% Solving L1 regression
b2=[-y;y];
O1=eye(size(y,1),size(y,1));
A2=[-X -O1; X -O1];
for i=1:size(A2,2)
    if i<=size(A2,2)-size(y,1)
    f(i)=0;
    lb(i)=-inf;
    else
        f(i)=1;
        lb(i)=0;
    end
end

[xhat,fvalhat]=linprog(f,A2,b2,[],[],lb,[]);
coeffs1=xhat(1:size(A2,2)-size(y,1)); %first coeff = constant term of the model

% Predict from L1 regression model and computing errors
if size(Xtest,1)>0
    ypred=Xtest*coeffs1;
    disp('Root Mean Squared Error or RMSE in L1 regression');
    RMSE1=sqrt(mean((ypred-ytest).^2))
    disp('Mean Absolute Deviation or MAD in L1 regression');
    MAD1=mean(abs(ypred-ytest))
    disp('R-squared in L1 regression');
    Rsq1=mean((ypred-mean(ytest)).^2)/var(ytest)
end

end

