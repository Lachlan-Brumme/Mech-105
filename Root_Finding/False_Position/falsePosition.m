function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
%inputs
%func is the function being assessed
%xl is the lower x guess
%xu is the higher x guess
%es is the desired percent error
%outputs
%root is the root of the function
%fx is the function at the root
%ea is the percent error when the function is done running
%maxit is the max number of iterations allowed
%iter is the amount of iterations it took
% checking to make sure there are enough inputs
if nargin <5
    maxit = 200;
    if nargin <= 3
        if nargin == 3
            es = .0001;
        else
            error('error: not enough input arguments')
        end
    end
end
%checking to see if there is a root between bounds or if the root is one of
%the bounds
if func(xl)*func(xu) >= 0
    if func(xl)*func(xu) > 0
        error('Error: no root between bounds')
        %checking if either of the guesses were the root and if they were
        %it chooses that as the root
    elseif func(xl) == 0
       error('root is first bound')
    else
        error('root is second bound')
    end
end
%starting numbers so that the algorithm has numbers to start the iterations
%and percent error
ec=100;
iter=0;
while iter < maxit && ec > es
    %calculating the new bracket
    xrnew = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
    if func(xrnew)*func(xu) > 0
        xu = xrnew;
    else
        xl =xrnew;
    end
    % checks to see if it is possible to calculate the percent error
    if iter >= 1
        %calculats the current error
        ec = abs((xrnew-xrold)/xrnew)*100;
        % if the answer is not a number it has divided by zero which would
        % be 0% error
        if isnan(ec)
            ec = 0;
            if  ec < es
                break
            end
        end
    end
    xrold = xrnew;
    iter=iter+1;
end
root = xrnew;
fx = func(root);
ea = ec;
end