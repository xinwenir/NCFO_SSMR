function [AOut, BOut, COut, DOut, OrdsOut, Flag,TestFlag] =...
     reduceRMCCREigVec(A,B,C,D,Ops,Ords)

%--------------------------------------------------------------------
%  reduceRMCCREigVec
%     Obtained a reduced Roesser model by constrained
%     common right eigenvectors.
%
%  Syntax:
%  [AOut, BOut, COut, DOut, OrdsOut, Flag,TestFlag] =...
%     reduceRMCCREigVec(A,B,C,D,Ops,Ords)
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
% Examples:
% >>  A =[
%        8, -6, 16,  5
%        9, -7, 22,  7
%       12, -8,  5,  1
%      -39, 27, -9, -1]
% >>  B =[
%       5
%       7
%       0
%      -1]
%
% >>  C = [ -1, 1, 6, 2]
% >>  D =[0]
% >>  Ords =[2,2]
% >>  syms z1 z2
% >>  Ops =[z1 z2]
% >>  [AOut, BOut, COut, DOut, OrdsOut, Flag,TestFlag] =...
%     reduceRMCCLEigVec(A,B,C,D,Ops,Ords)

%--------------------------------------------------------------------------
% Initialization
Flag = 0;  % Deletion flag
OpsNum =  numel(Ops);
OrdsSum = sum(Ords);
DOut=D;
Flag  = 0;
% Calculate the original transfer matrix
Z = [];
for Ind2 = 1:OpsNum
    Z = blkdiag(Z,Ops(Ind2)*eye(Ords(Ind2)));       % calculate Z.
end
G0 = collect(C*Z/(eye(size(Z,1))-A*Z)*B+D);
A = sym(A);
% Calculate the Bolck Bound ColStart and ColEnd
[Starts, Ends] = bound(Ords);
%------------------------------------------------------------------
% Partition A and C  such that
%  A = ACell{1} + ... + ACell{OpsNum} and
%  C = CCell{1} + ... + CCell{OpsNum}
ACell = cell(1,OpsNum);
CCell = cell(1,OpsNum);
AZero = sym(zeros(OrdsSum));
CZero = sym(zeros(size(C)));
CC = [];
EigAAllCell = cell(1,OpsNum);
EigNumsCell = {};

for Ind2 = 1:OpsNum
    Ak = AZero;
    Ak(:,Starts(Ind2):Ends(Ind2)) = A(:,Starts(Ind2):Ends(Ind2));
    ACell{Ind2} = Ak;
    EigAk = eig(Ak);
    EigAk = unique(EigAk); % delete the repeated eigenvalues
    EigAAllCell{Ind2} = EigAk;
    EigAkNum = numel(EigAk);
    EigNumsCell{Ind2} = 1:1:EigAkNum;
    
    Ck = CZero;
    Ck(:,Starts(Ind2):Ends(Ind2)) = C(:,Starts(Ind2):Ends(Ind2));
    CCell{Ind2} = Ck;
    CC =[CC ; Ck];
end

IndesEigNumsCell = NChoose(EigNumsCell);
NIndesEigNumsCell = numel(IndesEigNumsCell);

Ir = eye(OrdsSum);
for IndSets = 1: NIndesEigNumsCell
    Fc = []; %F_c in the paper
    Indes1 =  IndesEigNumsCell{IndSets};
    % comput the matrix Fc
    for j_index = 1 : OpsNum
        Ak = ACell{j_index};
        Ck = CCell{j_index};
        EigAj = EigAAllCell{j_index};
        eigAjk = EigAj(Indes1(j_index));
        Theta_j = Ir*eigAjk - Ak;
        Fc = [Fc;Theta_j;Ck];
    end
    V = null(Fc);
    
    RV = real(V);
    IV = imag(V);
    %%%%%%%%%%%%%%%%%%%%
    if rank(Fc) < OrdsSum
        Flag = 1;
        Eig = [];
        for j_index = 1:OpsNum
            EigAj = EigAAllCell{j_index};
            eigAjk = EigAj(Indes1(j_index));
            Eig = [Eig, eigAjk];
        end
        V
        Fc
        vfc = Fc * V
        RV
        IV
        Eig
        Flag = 1;
        VNew = [RV,IV];
        
        VE =[VNew,eye(OrdsSum)];
        [~,VEjb] = echelonFormRow(VE);
        VRank = rank([RV,IV]);
        VEjbRed = VEjb(VRank+1:end);
        %---------------------------------------------------------
        % \Begin  Compute the orders
        [~,ColVNew ] = size(VNew);
        VEjbRed =  VEjbRed - ColVNew ;
        
        OrdsOut = zeros(1,OpsNum);
        for Ind = 1:OpsNum
            OrdInd = Starts(Ind):Ends(Ind);
            SetInt = intersect(OrdInd,VEjbRed);
            OrdsOut(Ind) = numel(SetInt);
        end
        %--\End compute the orders
        %-----------------------------------------------------------
        % --\Begin  Construct R and T
        T = VE(:,VEjb);
        R = T(:,VRank+1:end);
        TInv = inv(T);
        L = TInv(VRank+1:end,:);
        %---\End Construct R and T
        %---------------------------------------------------------
        break;
    end  
end

if Flag == 1
    % test
    AOut = L*A*R;
    BOut = L*B;
    COut = C*R;
    Z = [];
    for Ind2 = 1:OpsNum
        Z = blkdiag(Z,Ops(Ind2)*eye(OrdsOut(Ind2)));   % calculate Z.
    end
    G = simplify(COut*Z*inv(eye(size(Z,1))-AOut*Z)*BOut+DOut);
    Test = simplify(G-G0);
    if iszeroTest(Test)
        TestFlag = ones(size(G0));
    else
        TestFlag = Test==0;
    end
else
    % flag~=1 (flag==0) means that the dimension could not be reduced.
    AOut=A;
    BOut=B;
    COut=C;
    OrdsOut = Ords;
    TestFlag=ones(size(G0));
end


