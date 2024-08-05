clc
clear
h = 0.01;
Thn = 50;
tt = h : h : Thn;
t = Thn/h;
pi = 3.1415926;
r = 1;

%% test1
u = sin(pi*tt);
alpha = 0.8;    
%% Gen quadratic coefficients
[c_sx] = gen_pwqef_parameters(t,alpha,h,r,1024);
c_sx_hex = num2hex(single(c_sx))
writematrix(c_sx_hex,'pwqef1_rom.txt','Delimiter','tab');
alpha_hex = num2hex(single(alpha))
h_q_hex = num2hex(single(1/(h^alpha)))
u_hex = num2hex(single(u));
writematrix(u_hex,'u_sin_rom.txt','Delimiter','tab');

%% test2
u = sin(pi*tt);
alpha = -0.8;
%% Gen quadratic coefficients
[c_sx] = gen_pwqef_parameters(t,alpha,h,r,1024);
c_sx_hex = num2hex(single(c_sx))
writematrix(c_sx_hex,'pwqef2_rom.txt','Delimiter','tab');
alpha_hex = num2hex(single(alpha))
h_q_hex = num2hex(single(1/(h^alpha)))
u_hex = num2hex(single(u));
writematrix(u_hex,'u_sin_rom.txt','Delimiter','tab');

%% test 3
u = square(tt);
alpha = -0.9;
%% Gen quadratic coefficients
[c_sx] = gen_pwqef_parameters(t,alpha,h,r,1024);
c_sx_hex = num2hex(single(c_sx))
writematrix(c_sx_hex,'pwqef3_rom.txt','Delimiter','tab');
alpha_hex = num2hex(single(alpha))
h_q_hex = num2hex(single(1/(h^alpha)))
u_hex = num2hex(single(u));
writematrix(u_hex,'u_square_rom.txt','Delimiter','tab');

%% test 4
u = square(tt);
alpha = -0.3;
%% Gen quadratic coefficients
[c_sx] = gen_pwqef_parameters(t,alpha,h,r,1024);
c_sx_hex = num2hex(single(c_sx))
writematrix(c_sx_hex,'pwqef4_rom.txt','Delimiter','tab');
alpha_hex = num2hex(single(alpha))
h_q_hex = num2hex(single(1/(h^alpha)))
u_hex = num2hex(single(u));
writematrix(u_hex,'u_square_rom.txt','Delimiter','tab');

%% test 5
u = sawtooth(tt);
alpha = -0.9;    
%% Gen quadratic coefficients
[c_sx] = gen_pwqef_parameters(t,alpha,h,r,1024);
c_sx_hex = num2hex(single(c_sx))
writematrix(c_sx_hex,'pwqef5_rom.txt','Delimiter','tab');
alpha_hex = num2hex(single(alpha))
h_q_hex = num2hex(single(1/(h^alpha)))
u_hex = num2hex(single(u));
writematrix(u_hex,'u_sawtooth_rom.txt','Delimiter','tab');

%% test 6
u = sawtooth(tt);
alpha = -0.2;
%% Gen quadratic coefficients
[c_sx] = gen_pwqef_parameters(t,alpha,h,r,1024);
c_sx_hex = num2hex(single(c_sx))
writematrix(c_sx_hex,'pwqef6_rom.txt','Delimiter','tab');
alpha_hex = num2hex(single(alpha))
h_q_hex = num2hex(single(1/(h^alpha)))
u_hex = num2hex(single(u));
writematrix(u_hex,'u_sawtooth_rom.txt','Delimiter','tab');


