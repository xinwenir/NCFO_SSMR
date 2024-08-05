function [Flag] = iszeroTest(p)
%--------------------------------------------------------------------
%   Purpose:
%      Check wether the given object is the zero element.
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
Flag = sym(feval(symengine,'iszero',p));
