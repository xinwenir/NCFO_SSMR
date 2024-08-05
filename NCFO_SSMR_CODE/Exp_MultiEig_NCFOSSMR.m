% Example for nEig order reduction approach.
clc 
clear

syms z1 z2 z3 z4

%% exp_1
A0 = [	
   -8,	0,	1,	0,	0, -8,	0,	0,	0;	
	0,	0,	0,	0,	0,	0,	1,	0,	0;
    0,	0,	0,	1,	0,  0,	0,	1,	0;
	0,	0,	0,	0,	0,	0,	0,	0,	0;
  -90,	0,	0,	0,	0,-90,	0,	0,	0;
  -26,	1,	0,	0,	0,-26,	0,	0,	0;
    0,	0,	0,	0,	0,  0,	0,	0,	0;
  -73,	0,	0,	0,	1,-73,	0,	0,	1;
	0,	0,	0,	0,	0,	0,	0,	0,	0];

B0 = [0;	0;	0;	0;	0;	0;	0;	0;	1];

C0 = [1,	0,	0,	0,	0,	1,	0,	0,	0];
A = A0';
B = C0';
C = B0';
D = 0;

Ords = [2, 3, 4];
Ops =[z1, z2, z3];

%% exp_2
% A = [0, 0,     0, 0, 1, 0, 0, 0;
%      0, 0,     0, 0, 0, 0, 0, 0;
%      1, 0,  -3.1, 1, 0, 0, 0, 0;
%      0, 1, -2.89, 0, 0, 0, 0, 0;
%      0, 0,  -2.5, 0, 0, 1, 0, 1;
%      0, 0,     0, 0, 0, 0, 1, 0;
%      0, 0,  -1.2, 0, 0, 0, 0, 0;
%      0, 0,     0, 0, 0, 0, 0, 0];
% 
% B = [0; 0; 0; 0; 0; 0; 2; 5];
% 
% C = [0,  0,  1,  0,  0,  0,  0,  0];
% 
% D = 0;
% 
% Ords = [2, 5, 1];
% Ops =[z1, z2, z3];

%% exp_3
% A = [ 
%  1,  1, -2, -1,  2,  0, -1, -2,  0;
%  0,  1, -4, -1,  0,  2, -1, -3,  1;
%  2,  0,  2, -1, -1, -4, -1, -4,  0;
%  0,  2, -6, -1,  5,  4, -1,  0,  0;
%  1,  1, -1, -1,  2,  0, -1, -2, -1;
% -1,  0,  0,  0, -2,  3,  0,  0,  0;
% -9, -1,  3,  5,  4,  4,  7,  6, -1;
%  5,  0, -1, -2, -1, -5, -3, -2,  1;
%  0,  0, -1,  0,  0,  0,  0,  0,  1];
%  
%  
% B = [ 
%  1;
%  1;
%  1;
%  1;
% -1;
%  0;
% -1;
%  1;
%  1 ];
%  
% C = [
% 0, 0, -1, 0, 1, -2, 1, -2, 1;
% 0, 0,  1, 0, 0,  1, 0,  1, 1];
%  
%  
% D = [0; 0];
%  
% Ords = [4,4,1];
% Ops =[z1, z2, z3];



OpsNum = numel(Ops);
A = sym(A);
B = sym(B);
C =sym(C);
D = sym(D);

%%  ALL method Row & Column -structural MultiEigenvalues
[AOut, BOut, COut, DOut, OrdsOut, Flag,TestFlag] =...
    reduceRMCCEigVecAll(A,B,C,D,Ops,Ords) 

%% Based on Row-structural MultiEigenvalues
% [AOut, BOut, COut, DOut, OrdsOut, Flag,TestFlag] =...
%     reduceRMCCREigVec(A,B,C,D,Ops,Ords)

%% Based on Column-structural MultiEigenvalues 
% [A, B, C, D, Ords, FlagLeft,TestLeft] =...
%      reduceRMCCLEigVec(A,B,C,D,Ops,Ords)
