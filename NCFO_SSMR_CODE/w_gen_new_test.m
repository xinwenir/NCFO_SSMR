clc
clear

h = 0.01;
Thn = 25;
alpha = 0.6;

[w, w_nf, nsp,t] = w_gen_new(alpha,h,Thn);
w_f = w(9:end);
t_f = t(9:end);