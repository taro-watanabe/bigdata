function [coeffs2]=L2Regression(A,b,train)
%L2Regression(A,b,train) 
%reads a sample consisting of input vars and corresponding output
%(row of A and corresponding value of b) and %computes 
%the coefficients of the input vars which minimizes 
%the sum of squared errors (L2 regression)
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
ntrain=round(size(A,1)*train);
ntest=size(A,1)-ntrain;
Aen=[ones(size(A,1),1) A]; %enlarged A with first column equal to 1
X=Aen(1:ntrain,:);
y=b(1:ntrain,1);
Xtest=Aen(ntrain+1:end,:);
ytest=b(ntrain+1:end,:);

% Solving L2 regression
coeffs2=(X'*X)^(-1)*X'*y;

% Predict from L2 regression
if size(Xtest,1)>0
    ypred=Xtest*coeffs2;
    disp('Root Mean Squared Error or RMSE in L2 regression');
    RMSE2=sqrt(mean((ypred-ytest).^2))
    disp('Mean Absolute Deviation or MAD in L2 regression');
    MAD2=mean(abs(ypred-ytest))
    disp('R-squared in L2 regression');
    Rsq2=mean((ypred-mean(ytest)).^2)/var(ytest)
end

end

