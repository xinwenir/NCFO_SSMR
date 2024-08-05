function [Flag] = isoneTest(P)
%--------------------------------------------------------------------
%   Purpose:
%      Check wether the given object is the 1 element.
%   Syntax:
%      [Flag] = iszeroTest(p)
%   Description:
%      if p is zero return True
%   Example:
%     syms s a
%     A =[s,0 0
%         0 0 0
%         a s 0]
%     p = A(1,:)
%     p = A(2,:)
%     p = A(3,:)
PZero = P - ones(size(P));
Flag = iszeroTest(PZero);
