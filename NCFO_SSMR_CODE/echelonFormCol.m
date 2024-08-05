function [R,jb] = echelonFormCol(A)
%--------------------------------------------------------------------
% echelonFormCol
% reduced column-echelon form.
%
% Syntax
%  [R,jb] = echelonFormCol(A)
% 
% Description
% [R,jb] = echelonFormCol(A) returns a reduced column-echelon form of A
%and a vector, jb, so that:
% r = length(jb) is this algorithm's idea of the rank of A,
% r = length(jb) is this algorithm's idea of the column rank of A,
% A(jb,:) is a basis for the column range of A,
% R(jb,1:r) is the r-by-r identity matrix.
%   Example:
%>>     A = magic(4);
%>>     [R,jb] = echelonFormRow(A)
% R =
%  
% [ 1, 0,  0, 0]
% [ 0, 1,  0, 0]
% [ 0, 0,  1, 0]
% [ 1, 3, -3, 0]
%  
% 
% jb =
% 
%      1     2     3
AT = A.';
[RT,jb] = echelonFormRow(AT);
R = RT.';
%matout = sym(feval(symengine,'linalg::addCol',mat,iind,jind,poly));
end