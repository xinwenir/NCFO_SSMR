function [dx] = GLF_Quadratic(u,t,alpha,h,L) %u = xxxx*t.t = 0 : 1 : 1000

    dx = zeros(1,'single');
    
    Thn = t * h;
    gl = 1;
    [w,w_linear, s_LinearFit_p, w_quadratic, s_quadraticFit_p] = w_linear_quadratic_gen(L,h,Thn,alpha); 
    for i = 1 : t
        u_q = rot90(u(1 : i));
        w_q = w_quadratic(1 : i);
        dx_q = glfdiff_sim(u_q,i,w_q,gl);
        dx(i) = dx_q/(h^alpha);
        %dx = glfdiff_sim_l(u,i,w_quadratic,L,gl);
    end
end