function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
if isvector(x) == 0|| isvector(y) == 0
    error('inputs must be vectors')
end
if length(x) ~= length(y)
    error('vectors must have equal lengths')
end
L=length(x);
m = diff(x);
for j  = 1:length(m)
    d = m(1) == m(j);
    if d == 0
        error('spacing is not equal')
    end
end
if length(x) == 2
    warning('trap rule is being used')
    h=x(2)-x(1);
    I = h*(y(1)+y(2))/2;
    return
elseif length(x) == 3
    h = x(3)-x(1);
    I = h*(y(1)+4*y(2)+y(3))/6;
    return
end
   odd = y(2:2:L-1);
   Todd = sum(odd);
   even = y(3:2:L-1);
   Teven = sum(even);
if rem(length(x),2) == 1
    ;
h = (max(x)-x(1))/(3*(L-1));
    I = h*(y(1)+y(L-1)+4*Todd+2*Teven);

else
warning('trap rule was used for the last segment')
h = (x(L-1)-x(1))/(3*(L-2));
    I = h*(y(1)+y(L-1)+4*Todd+2*Teven);
    h = (x(L)-x(L-1));
    I = I + h*(y(L-1)+y(L))/2;
end
end