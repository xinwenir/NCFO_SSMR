% 算法Grünwald-Letnikov分数阶导数与积分:
% (1)计算给定信号在各个时刻的函数值，构�?向量f
% (2)由式$w_0 = 1, w_j = (1 - (\alpha + 1)/j)w_{j-1}, j = 1,2,....$递推计算二项式系数wj;
% (3)由式$\frac{1}{h^{\alpha}}\sum_{j=0}{(t-t_0)/h}w_{j}f(t-jh)$计算给定函数的分数阶微分或积分的值�?
function dy = glfdiff_sim_l(y,n,w,L,gl)
%   arguments, y(:,1) double, n(1,1) int32, w(1,:) double, end  
   
    if nargin == 4
        if n <= L
            dy = w(1 : 1 : n - 1) * y(1: 1 : end);
        else
            dy = w(1 : 1 : L) * y(1: 1 : L);
        end
    elseif nargin == 5
        if n <= L
            dy = w(1 : 1 : n) * y(1: 1 : end) * gl;
        else
            dy = w(1 : 1 : L) * y(1: 1 : L) * gl;
        end
    end
end
 

    %test: t =0:0.001:1;y=ones(size(t));y1=glfdiff(y,t,0.75);y2=glfdiff(y,t,-0.75);plot(t,y1,t,y2)
    %test: t =0:1:1000;y=sin(3.1415926*t/20);y1=glfdiff(y,t,0.8);y2=glfdiff(y,t,-0.8);plot(t,y1,t,y2)
    %test: t =0:1:1000;plot(t,y1,t,dy)

% clc
% clear
% y = sin(3.1415926*0/20);
% dy = 0;
% for i = 0 : 1000
%     n = i + 1
%     h = 1.0;
%     gam = 0.8;
%     if i > 0
%           y = [y ; sin(3.1415926*i/20)];
%     end 
%     dy_q = glfdiff_sim(y,n,h,gam)
%     if i > 0
%         dy = [dy dy_q];
%     else
%         dy = dy_q;
%     end
% end    
