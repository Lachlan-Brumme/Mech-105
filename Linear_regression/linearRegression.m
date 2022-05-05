function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
lx = length(x);
ly = length(y);
if ly ~= lx
    error('Arrays must be the same size')
end
l = length(y);
[sortedy, sortOrder] = sort(y);
sortedX = x(sortOrder);
Q1 = floor((l+1)/4);
yq1 = sortedy(Q1);
Q3 = floor((3*l+3)/4);
yq3=sortedy(Q3);
IQR = sortedy(Q3)-sortedy(Q1);
newq=IQR*1.5;
for i = 1:l
    if sortedy(i) > yq3 + IQR
        sortedy = sortedy(1:i-1);
        sortedX = sortedx(1:i-1);
        difference = length(sortedy(i:l));
        l = l-difference;
        break
    elseif sortedy(i) < yq1-newq
        sortedy(i) = [];
        sortedX(i) = [];
        l = l-1;
    end
end
    fY = sortedy;
    fX = sortedX;
yhat=sum(fY)/l;
ysum=sum(fY);
xsum = sum(fX);
xysum = sum(fX.*fY);
x2sum = sum(fX.^2);
xsum2 = (sum(fX))^2;
slope = ((l*xysum)-(ysum*xsum))/((l*x2sum)-(xsum2))
intercept = yhat - slope*xsum/l;
sst = sum((fY-yhat).^2);
ssr = sum((fY - intercept - slope*fX).^2);
Rsquared = 1 - (ssr/sst);
end