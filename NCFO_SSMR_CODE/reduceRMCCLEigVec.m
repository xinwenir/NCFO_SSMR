function [AOut, BOut, COut, DOut, OrdsOut, Flag,TestFlag] = ...
    reduceRMCCLEigVec(A,B,C,D,Ops,Ords)
%--------------------------------------------------------------------
%  reduceRMCCLEigVec
%     Obtained a reduced Roesser model by constrained
%     common left eigenvectors.
% 
%  Syntax:
%  [AOut, BOut, COut, DOut, OrdsOut, Flag,TestFlag] =...
%     reduceRMCCLEigVec(A,B,C,D,Ops,Ords)
% 
%  Description:
%     Inpus:
%         A, B, C, D - the original Roesser state-space realization 
%         Ops - a vector whose entries are backward operators 
%             in the system
%         Ords - orders of the operators
%     Output:
%         AOut, BAOut, CAOut, DAOut - a new  n-D Roesser model
%             with lower oder.
%         flag - reduction flag
%         0: no reduction
%         1: reduction complete
%         test - test result
%             0: wrong
%             1: right
%   Examples:
%--------------------------------------------------------------------------
% 
% >>  A =[
%          8     9    12   -39
%         -6    -7    -8    27
%         16    22     5    -9
%          5     7     1    -1  ]
% >>  B = [
%          -1
%          1
%          6
%          2 ] 
% >>  C = [5     7     0    -1]
% >>  Ords =[4,1]
% >>  syms z1 z2
% >>  Ops =[z1 z2]
% >>  [AOut, BOut, COut, DOut, OrdsOut, Flag,TestFlag] = ...
%     reduceRMECoTrim(A,B,C,D,Ops,Ords)

% Begin Initialization
Flag=0;  % Deletion flag
AT = A.';
BT = C.';
CT = B.';
DT = D.';
% End Initialization
[ATOut, BTOut, CTOut, DTOut, OrdsOut, Flag,TestFlag] =...
    reduceRMCCREigVec(AT,BT,CT,DT,Ops,Ords);
AOut = ATOut.';
BOut = CTOut.';
COut = BTOut.';
DOut = DTOut.';
TestFlag = TestFlag.';
end


