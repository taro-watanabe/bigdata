close all
clc
AA=load('A200123.txt');
sizeAA=size(AA)
b=load('B200123.txt');
sizeb=size(b)

%help L1Regression
coeffs=L1Regression(AA,b);
%coeffs=L1Regression(AA,b,0.5);

%help L2Regression
coeffs2=L2Regression(AA,b);
%coeffs2=L2Regression(AA,b,0.5);