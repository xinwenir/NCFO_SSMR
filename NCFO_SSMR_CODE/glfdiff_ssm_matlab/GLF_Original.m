function [dx] = GLF_Original(u,t,alpha,h,L) %u = xxxx*t.t = 0 : 1 : 1000

    dx = zeros(1,'single');
    
    Thn = t * h;
    gl = 1;
    tt = h : h : Thn;
    w = 1.0;
    if exist("Lend","var")
        for j = 2 : Lend % w_0 = 1, w_j = (1 - (\alpha + 1)/j)w_{j-1}, j = 1,2,....
            w(j) = w(j - 1)*(1-(alpha + 1)/(j - 1));
        end
    else
        for j = 2 : length(tt) % w_0 = 1, w_j = (1 - (\alpha + 1)/j)w_{j-1}, j = 1,2,....
            w(j) = w(j - 1)*(1-(alpha + 1)/(j - 1));
        end
    end    
%     [w, w_qf, qsp, w_lf,lsp] = w_gen(alpha,h,Thn,L);
    
    for i = 1 : t
        u_q = rot90(u(1 : i));
        w_q = w(1 : i);
        dx_q = glfdiff_sim(u_q,i,w_q,gl);
        dx(i) = dx_q/(h^alpha);
        %dx = glfdiff_sim_l(u,i,w,L,gl);
    end
end