function [dx] = GLF_wPWL(u,t,alpha,h,L,gg) %u = xxxx*t.t = 0 : 1 : 1000
    L0 = 32;
    dx = zeros(1,'single');
    
    Thn = t * h;
    gl = 1;
    [w, w_qf, qsp, w_lf,lsp] = w_gen(alpha,h,Thn,L,"linear");
    w_lf(1 : L0) = w(1 : L0);
    for i = 1 : t
        u_q = rot90(u(1 : i));
        w_q = w_lf(1 : i);
        if nargin == 6
            dx_q = glfdiff_sim_l(u_q,i,w_q,L,gl);
        else 
            dx_q = glfdiff_sim(u_q,i,w_q,gl);
        end
        dx(i) = dx_q/(h^alpha);
        %dx = glfdiff_sim_l(u,i,w_lf,L,gl);
    end
end