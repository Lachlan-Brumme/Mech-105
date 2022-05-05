function root = newtraph(f,df,xi,precision)
% comments on input and output
%Calculate f(xi) and f'(xi)
fxi=f(xi);
dfxi=df(xi);
%Iteration for Newton Raphson method begins
while abs(fxi)>precision
%Calculate the new estimated root,x_i_+_1
xi=xi-fxi/dfxi;
fxi=f(xi);       %recalculate f(x_i_+_1)
dfxi =df(xi);     %recalculate f'(x_i_+_1)
end
%The final xr value is the root
root = xi;