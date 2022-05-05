function [root, iter, ea] = sec(func,x1,x2,i,es)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if nargin < 3
 error('error not enough inputs')
elseif nargin < 4 
    es= .0001;
    i = 200;
elseif nargin < 5
    es = .0001;
end
j=0;
ec = 100;
while (j<i) && (ec>es)
    x3 = x1-func(x1)*((x2-x1)/(func(x2)-func(x1)));
    if j >= 1
        ec = abs((x3-x2)/x3)*100;
    end
    x1 = x2;
    x2 = x3;
    j = j+1;
end
root = x2;
iter = j;
ea = ec;
end