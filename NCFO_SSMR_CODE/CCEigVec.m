function [V] = CCEigVec(ACell,C)
%--------------------------------------------------------------------
% CComEigVec
% 
% Constrained common eigenvectors 
% 
% Syntax
% 
% [V] = CComEigVec(A,C)
% 
% Description  
% 
% [V] = CComEigVec(A,C) with A ={A_1,...,A_n} returns the
%common eigenvectors of  A_1,...A_n constrained by C.  
% Example:
% A1 =[
%     -1     1    -1     0     0     0     0     0     0     0
%     -2     1    -3     0     0     0     0     0     0     0
%     -2     0     4     1     0     0     0     0     0     0
%     -4     2    -4     1     0     0     0     0     0     0
%     -1     1     0     0     0     0     0     0     0     0
%     -1     0     0     0     0     0     0     0     0     0
%     -3    -1     0     2     0     0     0     0     0     0
%     1     0     1     0     0     0     0     0     0     0
%     -2     0     1     1     0     0     0     0     0     0
%     0     0    -1     0     0     0     0     0     0     0]
% A2 =[
%     0     0     0     0     3     2     0     0     0     0
%     0     0     0     0     1     4     0    -1     0     0
%     0     0     0     0     1     0     1     0     0     0
%     0     0     0     0     7     8     1     4     0     0
%     0     0     0     0     3     2     0     0     0     0
%     0     0     0     0    -2     3     0     0     0     0
%     0     0     0     0     1    -2     4     0     0     0
%     0     0     0     0     1    -1    -1     2     0     0
%     0     0     0     0     1     2     1     2     0     0
%     0     0     0     0     0     0     0     0     0     0]
% A3 =[
%     0     0     0     0     0     0     0     0     1     0
%     0     0     0     0     0     0     0     0     1     1
%     0     0     0     0     0     0     0     0     2     0
%     0     0     0     0     0     0     0     0     2     0
%     0     0     0     0     0     0     0     0     1    -1
%     0     0     0     0     0     0     0     0     0     0
%     0     0     0     0     0     0     0     0    -3    -1
%     0     0     0     0     0     0     0     0     2     1
%     0     0     0     0     0     0     0     0     1     0
%     0     0     0     0     0     0     0     0     0     1]
% C =[
%    -2     0     0     1     0     0     0     0     0     0
%      0     0     1     0     0     0     0     0     0     0
%      0     0     0     0     2     0     2     0     0     0
%      0     0     0     0     0     1     0     1     0     0
%      0     0     0     0     0     0     0     0     1     1
%      0     0     0     0     0     0     0     0     0     1]
% ACell = {A1,A2,A3}
 %   See Also:
%    
%     
%   Date: 
%      02 2, 2018 
%---------------------------------------------------------------------
ACellNum = numel(ACell);
AISize = size(ACell{1},1);
X = sym('x%d',[AISize,1]) ;
Vars = X.';
Vars = sym(Vars);
PolyFA =[];
for Ind = 1:ACellNum
    AI = ACell{Ind};
    M =[AI*X, X];
    PolyFAI = minor(M,2);
    PolyFA = [PolyFA,PolyFAI];
    
end
PolyFC = C*X;
PolyFC = PolyFC(:).';
PolyFA = [PolyFA,PolyFC];
PolyFA = expand(PolyFA);
PolyFAGBasis = gbasis(PolyFA,Vars,'LexOrder');

%%%%%%%%%Using 'solve' function solve the equations. 
Sols = feval(symengine,'solve',PolyFAGBasis);
V = sol2mat(Sols,Vars);
return
