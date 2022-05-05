function [root,iter,ea] = modsec(func,x0,delta,i,es)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
if nargin < 3
 error('error not enough inputs')
elseif nargin < 4 
    es= .0001;
    i = 200;
elseif nargin < 5
    es = .0001;
end
j = 0;
ec = 100;
while (j<i) && (ec>es)
    xnew = x0 - ((func(x0)*delta))/(func(x0+delta)-func(x0));
    if j > 1
        ec = abs((xnew-x0)/xnew)*100;
    end
    x0 = xnew;
    j = j+1;
end
root = x0;
iter = j;
ea =ec;
end