function [R,jb] = echelonFormRow(A)
%--------------------------------------------------------------------
% echelonFormCol
% reduced row-echelon form.
%
% Syntax
%  [R,jb] = echelonFormRow(A)
% 
% Description
% [R,jb] = echelonFormCol(A)  returns a reduced row-echelon form of A
%and a vector, jb, so that:
% r = length(jb) is this algorithm's idea of the row rank of A,
% A(:,jb) is a basis for the range of A,
% R(1:r,jb) is the r-by-r identity matrix.
%   Example:
%     A = magic(4);
%     [R,jb] = echelonFormRow(A)
% R =
%  
% [ 1, 0, 0,  1]
% [ 0, 1, 0,  3]
% [ 0, 0, 1, -3]
% [ 0, 0, 0,  0]
%  
% 
% jb =
% 
%      1     2     3
%------------------------------------------------------
%A = sym(A);
% Since when the object A is a symbolic object, [R,jb] = rref(A) can not
% work, so we will not use [R,jb] = rref(A).
R =rref(A);
jb =[];
ir = 1;
rnA = size(A,1);
while ~iszeroTest(R(ir,:))
    findNon0 = find(R(ir,:)~=0);
    jb =[jb,findNon0(1)];
    ir = ir+1;
    if ir >rnA
        break,
    end
end

%end