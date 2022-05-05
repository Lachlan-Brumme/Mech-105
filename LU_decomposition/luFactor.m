function [L,U,P] = luFactor(A)
%luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix
if length(A) ~= width(A)
    %checking to see if the function is possible
    error('matrix needs to have same length and width')
end
%setting things up for the loops
l = length(A);
P = eye(l);
L = zeros(l);
col=1;
i = 0;
while col < l
    %loop that ends when it has gone through all of the changes needed
    for r = 1:l
        [~,pos] = max(abs(A([r:l],col)));
        if pos ~= 1
            %pivoting if the largest number is not in the right position
            A([r,pos+i],:) = A([pos+i,r],:);
            L([r,pos+i],:) = L([pos+i,r],:);
            P([r,pos+i],:) = P([pos+i,r],:);
        end
        for rcur = r+1:l
            %making the L and U matrices
            Atemp = A;
            mult = Atemp(rcur,col)/Atemp(r,col);
            L(rcur,col) = mult;
            Atemp(r,:) = Atemp(r,:).*mult;
            % A turns into U
            A(rcur,:) = Atemp(rcur,:)-Atemp(r,:);
        end
        % adding numbers so that the fucntion work for each loop and the
        % positions are correct
        col = col+1;
        i = i+1;
    end

end
for f=1:l
    %putting the ones in the diagoal of L
    L(f,f) = 1;
end
U = A;
end