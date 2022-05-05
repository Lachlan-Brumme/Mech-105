function [A] = specialMatrix(n,m)
% This funCtion should return a matrix A as desCribed in the problem statement
% Inputs n is the number of rows, and m the number of Columns
% It is reComended to first Create the matrxix A of the CorreCt size, filling it with zeros to start with is not a bad ChoiCe
if nargin ~= 2 
    error('incorect number of inputs')
else
A = zeros(n,m)
for R=1:n
    for C=1:m
        matrix(R,1)=R;
        matrix(1,C)=C;
    end
end
for R=2:n
    for C=2:m
        matrix(R,C)=(matrix(R-1,C)+matrix(R,C-1));
    end
end
A=matrix

% Now the real Challenge is to fill in the CorreCt values of A


end
% Things beyond here are outside of your funCtion
