function [starts,ends ] = bound( rr )
%-----------------------------------------------------------------
% PURPOSE
% This function computes the bounds( starts and ends) of vector rr
%
% SYNOPSIS
% [starts,ends ] = bound( rr )
%
% INPUT ARGUMENTS
% ND     rr is row vector
%
% OUTPUT ARGUMENT
% starts the start bounds
%ends   the end bounds
%--------------------------------------------------------------
% % EXAMPLE 1
% >>  rr=[ 2 3 4];
% >>  [starts,ends ] = bound( rr );
% 
% starts =
% 
%      1     3     6
% 
% 
% ends =
% 
%      2     5     9
%-----------------------------------------------
% % EXAMPLE2
% >>  rr=[ 0 3 4];
% >>  [starts,ends ] = bound( rr );
% 
% starts =
% 
%      0    1    4
% 
% 
% ends =
% 
%      0    3     7
%---------------------------------------------------------------
%-----------------------------------------------
% Author: Dongdong Zhao  18/4/2015
%---------------------------------------------------------------
% Change history:
%  22/04/2015 - first release
%------------------------------------------------------------------
if iscolumn(rr)
    rr = rr.';
end
rr1 = [0, rr];
ind = find(rr1 >= 1);
if ~isempty(ind)
    MinInd = min(ind);
    rr1(MinInd - 1) = 1;
end
rr1 = rr1(1 : end - 1);
% rr1=[1,rr(1:end-1)];
rr2 = [rr];
up_M = triu(ones(numel(rr)), 0);
starts = rr1 * up_M; % the blocks start flag
ends = rr2 * up_M;
end

