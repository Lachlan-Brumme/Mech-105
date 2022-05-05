function [root,iteration] = fixedpoint(a,f) %input intial approiximation and simplified form of function  
if nargin<1 % check no of input arguments and if input arguments is less than one then puts an error message
    fprintf('Error! Atleast one input argument is required.');
    return;
end
if nargin<2 % check no of input arguments and if input arguments is less than two then puts a=0
    a=0;
end
x(1) = f(a) ;
i =1 ;
temp = false;
while temp == false 
    x(i+1) = f(x(i));
    if x(i+1) == x(i)
        temp = true;
        root = x(i-1); 
        iteration = i-1;
        return;
    end
    i = i +1 ;
end
x
end
