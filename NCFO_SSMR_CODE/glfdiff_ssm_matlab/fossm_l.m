function [x,y] = fossm_l(u,t,A,B,C,D,x0,alpha,h,r,L) %u = xxxx*t.t = 0 : 1 : 1000
    %arguments, u(:,1) single, t(1,1) int32, A(:,:),B(:,:),C(:,:),D(:,:) single, x0(:,1), alpha(:,1) single, h(1,1) single, r(1,:) int32, end
    FO_N = length(r);
    w = ones(FO_N,1);
    DIM = sum(r);
    x = zeros(DIM,1,'single');
    x_q = zeros(DIM,1,'single');
    dx = zeros(DIM,1,'single');
    times = 0;
    for i = 1 : FO_N
        for j = 2 : L + 1 
            w(i,j)= w(i,j-1)*(1 - (alpha(i) + 1)/(single(j) - 1)); 
        end
    end  
    h_m = ones(FO_N,1);
    k = 1;
    for i = 1 : FO_N
        for j =1 : r(i)
            h_m(k) = h^alpha(i);
            k = k + 1;
        end
    end
    %h_m_str = num2hex(single(h_m))
    for i = 1 : t
        if i == 1
            x(:,1) = x0;
            y(:,1) = C*x0 + D*u(:,1);
        else
            k = 1;
            for foi = 1 : FO_N
                for j = 1 : r(foi)
                    x_q = rot90(x(k,1 : i-1));
                    %x_q
                    dx(k) = glfdiff_sim_l(x_q,i,w(foi,2:L+1),L);                  
                    k = k + 1;              
                end
            end           
            x(:,i) = (A*x(:,i-1) + B*u(:,i)).*h_m - dx;
%             times = times + 1
%             Ax = A*x(:,i-1);
%             Ax_str = num2hex(single(Ax))
% 
%             Bu = B*u(i);
%             Bu_str = num2hex(single(Bu))
% 
%             x_q = Ax + Bu;
%             x_q_str = num2hex(single(x_q))
% 
%             x_q2 = x_q.*h_m;
%             x_q2_str = num2hex(single(x_q2))
% 
%             dx_str = num2hex(single(dx))
%             
%             x_reg = x_q2 - dx;
%             x_reg_str = num2hex(single(x_reg))
% 
%             x(:,i) = x_reg;
            y(:,i) = C*x(:,i-1) + D*u(:,i);
        end        
    end
end   
