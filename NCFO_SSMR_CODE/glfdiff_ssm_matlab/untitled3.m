clc
clear

syms s

% A = [-1, 1, -1;
%      -1, 0, -1;
%      -1, 0, -1];
% B = [-1; -1; -1];
% C = [1, 0, 1];
% D = 1;
% Z = [s^0.8,   0,   0;
% 	   0, s^0.8,   0;
% 	   0,   0, s^1.2];
% H = C* inv(eye(3) - Z*A)*Z*B + D;
% simplify(H)
syms d1 d2 d3 n1 n2 n3 z1 z2 z3
A = [    -d1,  0, -d3,  0,   0,-d2;
           1,  0,   0,  0,   0,  0;
           0,  0,   0,  0,   1,  0;
         -d1,  0, -d3,  0,   0,-d2;
           0,  0,   0,  1,   0,  0;
           1,  0,   0,  0,   0,  0];
C = [0,  n1,  0,  0,  n2,  0];
B = [1; 0; 0; 1; 0; 0];
D = 0;
Z = [s^z1,   0,   0,     0,     0,     0;
	   0, s^z1,   0,     0,     0,     0;
	   0,   0, s^z1,     0,     0,     0;
       0,   0,     0, s^z2,     0,     0;
       0,   0,     0,     0, s^z3,     0;
       0,   0,     0,     0,     0, s^z3];

H = C*Z* inv(eye(6)-A*Z)*B + D;
H1 = expand(H);
simplify(H1)


syms d11 d12 d21 d22 n11 n12 n21 n31 n41 z1 z2
A = [0,   -d12,   0,   0,-d11,   0,  0;
     0,      0,   0,   0,   1,   0,  0;
     0,      0,-d21,-d22,   0,   0,  0;
     0,      0,   0,   0,   0,   0,  1;
     0,   -d12,   0,   0,-d11,   0,  0;
     0,      0,   0,   0,   1,   0,  0;
     0,      0,   1,   0,   0,   0,  0];

C = [0,  0,  0, 0,  n11,  n12,  n31;
    n21, 0,n41, 0,    0,    0,    0];

B = [1, 0; 
     0, 0; 
     0, 1; 
     0, 0; 
     1, 0; 
     0, 0; 
     0, 0];

D = 0;

Z = [s^z1,   0,   0,     0,     0,     0,   0;
	   0, s^z1,   0,     0,     0,     0,   0;
	   0,   0, s^z1,     0,     0,     0,   0;
       0,   0,     0, s^z1,     0,     0,   0;
       0,   0,     0,     0, s^z2,     0,   0;
       0,   0,     0,     0,     0, s^z2,   0;
       0,   0,     0,     0,     0,    0,s^z2];

H = C*Z* inv(eye(7)-A*Z)*B + D;
H1 = expand(H);
simplify(H1)


% A = [      0,  1,   0,  0,   0,  0,  0,  0;
%            0,  0,   1,  0,   0,  0,  0,  0;
%            0,  0,   0,  1,   0,  0,  0,  0;
%            0,  0,   0,  0,   1,  0,  0,  0;
%            0,  0,   0,  0,   0,  1,  0,  0;
%            0,  0,   0,  0,   0,  0,  1,  0;
%            0,  0,   0,  0,   0,  0,  0,  1;
%           -1,  0,  -1,  0,  -1,  0,  0,  0];
% C = [-1,  0,  -1,  0,  -1,  0,  0,  0];
% B = [0; 0; 0; 0; 0; 0; 0;  1];
% D = 1;
% Z = [s^0.2,   0,   0,     0,     0,     0,     0,     0;
% 	   0, s^0.2,   0,     0,     0,     0,     0,     0;
% 	   0,   0, s^0.2,     0,     0,     0,     0,     0;
%        0,   0,     0, s^0.2,     0,     0,     0,     0;
%        0,   0,     0,     0, s^0.2,     0,     0,     0;
%        0,   0,     0,     0,     0, s^0.2,     0,     0;
%        0,   0,     0,     0,     0,     0, s^0.2,     0;
%        0,   0,     0,     0,     0,     0,     0, s^0.2];
% H = C* inv(eye(8) - Z*A)*Z*B + D;
% simplify(H)

% syms s
% A= [
% 	   0,   0,   1;
%   -1/2.2,   0,   0;
% -1.2/2.2,   1,   0];
% 
% B =  [0; 1/2.2; 0];
% 
% C =  [1, 0, 0];
% 
% Z = [s^0.9,   0,   0;
% 	   0, s^0.9,   0;
% 	   0,   0, s^0.4];
% %     H = C* inv(eye(3) - Z*A) *Z*B
% H = C* inv(Z - A)*B
%     simplify(H)
% a1 = -(1.2/2.2);
% a2 = -1/2.2;
% a3 = 1/2.2;
% %a31 = a3 * 300/h;
% %a32 = a3 * 100/h;
% for i = 2:n
%     x3(i) = (a1*x2(i-1)+a2*x1(i-1)+a3*u(i))*h^q2-memo(x3,c2,i);
%     x2(i) = x3(i-1)*h^q1-memo(x2,c1,i);
%     x1(i) = x2(i-1)*h^q1-memo(x1,c1,i);

% syms s
% A= [-1.2/2.2,   1;
%       -1/2.2,   0];
% 
% B =  [0; 1/2.2];
% 
% C =  [1, 0];
% 
% Z = [s^1.3,   0;
% 	   0, s^0.9];
% H1 = C* inv(eye(2) - Z*A) *Z*B
% H = C* inv(Z - A)*B
%     simplify(H)    


% syms s
% h = 1/(0.8*s^2.2 + 0.5*s^0.9 + 1);
% g1 = 15 + 15*s^(-1) + 12.57*s;
% g2 = 4.16 + 12.39 *s^(-0.98) + 8.85 * s^(1.15);
% Hh1 = simplify(h*g1/(1+h*g1))
% H1N = expand((1257*s^2 + 1500*s + 1500)/(80*s^(16/5)))
% H1D = expand((1600*s + 1257*s^2 + 80*s^(16/5) + 50*s^(19/10) + 1500)/(80*s^(16/5)))
% 
% 
% Hh2 = simplify(h*g2/(1+h*g2))
% 
% A= [0, 1,    -20, -20;
%     0, 0, -18.75, -18.75;
%     1, 0, -15.71, -15.71;
%     0, 0,  -0.63, -0.63]; 
% 
% B =  [18.75; 18.75; 15.71; 0];
% 
% C =  [0, 0, 1, 1];
% 
% Z = [s^1.0,     0,    0,     0;
% 	     0, s^1.0,    0,     0;
%          0,     0,s^1.2,     0;
%          0,     0,    0, s^1.3];
% 
% H1 = C* inv(eye(4) - Z*A) *Z*B;
% H1 = expand(H1)
% H1 = simplify(H1) 
% H = C* inv(Z - A)*B;
% H = simplify(H) 
% n1 = (1571*s^(6/5) + 1875*s^(11/5) + 1875*s^(16/5)) / 100;
% vpa(n1,4)
% d1 = (s^(6/5)*(s*(1875*s + 2000) + 1571) + 63*s^(13/10) + 100)  / 100;
% vpa(d1,4)
% n = (1571*s^2 + 1875*s + 1875) / 1875;
% vpa(n,4)
% d = (2000*s + 1571*s^2 + 63*s^(21/10) + 100*s^(33/10) + 1875)/ 1875;
% vpa(d,4)


% A= [0, 1,  -6.45,  -6.45;
%     0, 0, -15.50, -15.50;
%     1, 0, - 0.63,  -0.63;
%     0, 0, -11.06, -11.06]; 
% 
% B =  [5.2; 15.50; 0; 11.06];
% 
% C =  [0, 0, 1, 1];
% 
% Z = [s^0.9,     0,    0,     0;
% 	     0, s^0.98,    0,     0;
%          0,     0,s^1.3,     0;
%          0,     0,    0, s^1.05];
% 
% H1 = C* inv(eye(4) - Z*A) *Z*B;
% H1 = expand(H1)
% H1 = simplify(H1) 
% H = C* inv(Z - A)*B;
% H = simplify(H) 
% n1 = (520*s^(11/5) + 1106*s^(21/20) + 1550*s^(159/50))/100;
% vpa(n1,4)
% d1 = (645*s^(11/5) + 63*s^(13/10) + 1106*s^(21/20) + 1550*s^(159/50) + 100) / 100;
% vpa(d1,4)
% n = (520*s^(49/50) + 1106*s^(213/100) + 1550)/1550;
% vpa(n,4)
% d = (63*s^(47/25) + 645*s^(49/50) + 100*s^(159/50) + 1106*s^(213/100) + 1550)/ 1550;
% vpa(d,4)

% syms s
% A= [-2.2, -2.2, 0, -2.2;
%     -2.9, -2.9, 1, -2.9;
%       -1,   -1, 0,   -1;
%    -3.32,-3.32, 0,-3.32]; 
% B =  [0; 0; 1; 0];
% 
% C =  [1, 1, 0, 1];
% 
% Z = [s^1.1,     0,    0,     0;
% 	     0, s^1.3,    0,     0;
%          0,     0,s^1.3,     0;
%          0,     0,    0, s^1.7];
% H1 = C* inv(eye(4) - Z*A) *Z*B;
% H1 = simplify(H1) 
% H = C* inv(Z - A)*B;
% H = simplify(H)  

% syms s
% A= [-0.83, 0,     0, 0,-0.83,     0;
%     -0.39, 0,     0, 0,-0.39,     0;
%         0, 0, -0.46, 0,    0, -0.46;
%         0, 0, -0.99, 0,    0, -0.99;
%     -0.47, 1,     0, 0,-0.47,     0;    
%         0, 0, -2.14, 1,    0, -2.14];
%     
% B =  [0, 1.67; 0.56, 0.78; 0, 1.54; 1.98, 3.3; 0.67, 0; 4.29, 0];
% 
% C =  [1, 0, 0, 0, 1, 0;
%       0, 0, 1, 0, 0, 1];
% 
% Z = [s^1.1,     0,    0,     0,     0,     0;
% 	     0, s^1.1,    0,     0,     0,     0;
%          0,     0,s^1.1,     0,     0,     0;
%          0,     0,    0, s^1.1,     0,     0;
%          0,     0,    0,     0, s^1.2,     0;
%          0,     0,    0,     0,     0, s^1.3]
% %     H = C* inv(eye(3) - Z*A) *Z*B
% H = C* inv(Z - A)*B
%     simplify(H)  
% gn1 = (67*s^(11/10) + 56)/39 * 0.7;
% vpa(gn1,3)
% gd1 = (83*s^(6/5) + 47*s^(11/10) + 100*s^(23/10) + 39)/39 * 0.7;
% vpa(gd1,3)
% gn2 = (167*s^(6/5) + 78)/39 * 0.7;
% vpa(gn2,3)
% gd2 = (83*s^(6/5) + 47*s^(11/10) + 100*s^(23/10) + 39)/39 * 0.7;
% vpa(gd2,3)
% gn3 = (429*s^(11/10) + 198)/99 * 0.9;
% vpa(gn3,3)
% gd3 = (100*s^(12/5) + 214*s^(11/10) + 46*s^(13/10) + 99)/99 * 0.9;
% vpa(gd3,3)
% gn4 = (154*s^(13/10) + 330)/99 * 0.9;
% vpa(gn4,3)
% gd4 = (100*s^(12/5) + 214*s^(11/10) + 46*s^(13/10) + 99)/99 * 0.9;
% vpa(gd4,3)

% syms s
% A= [-0.83, 0,     0, 0,-0.83,     0;
%     -0.39, 0,     0, 0,-0.39,     0;
%         0, 0, -0.46, 0,    0, -0.46;
%         0, 0, -0.99, 0,    0, -0.99;
%     -0.47, 1,     0, 0,-0.47,     0;    
%         0, 0, -2.14, 1,    0, -2.14];
%     
% B =  [-1.67, 0.01; -0.39, -0.39; -1.54, 0.01; -1.9, -1.39; 0.47, -0.47; 3.02, -3.04];
% 
% C =  [1, 0, 0, 0, 1, 0;
%       0, 0, 1, 0, 0, 1];
% 
% Z = [s^1.1,     0,    0,     0,     0,     0;
% 	     0, s^1.1,    0,     0,     0,     0;
%          0,     0,s^1.1,     0,     0,     0;
%          0,     0,    0, s^1.1,     0,     0;
%          0,     0,    0,     0, s^1.2,     0;
%          0,     0,    0,     0,     0, s^1.3]
% %     H = C* inv(eye(3) - Z*A) *Z*B
% H = C* inv(Z - A)*B
%     simplify(H)  
% gn1 =  -(167*s^(6/5) - 47*s^(11/10) + 39)/39 * 0.7;
% vpa(gn1,3)
% gd1 = (83*s^(6/5) + 47*s^(11/10) + 100*s^(23/10) + 39)/39 * 0.7;
% vpa(gd1,3)
% gn2 = -(235*s^(11/10) - 3*s^(6/5) + 195)/195 * 0.7;
% vpa(gn2,3)
% gd2 = (415*s^(6/5) + 235*s^(11/10) + 500*s^(23/10) + 195)/195 * 0.7;
% vpa(gd2,3)
% gn3 = -(154*s^(13/10) - 302*s^(11/10) + 190)/99 * 0.9;
% vpa(gn3,3)
% gd3 = (100*s^(12/5) + 214*s^(11/10) + 46*s^(13/10) + 99)/99 * 0.9;
% vpa(gd3,3)
% gn4 = -(1520*s^(11/10) - 3*s^(13/10) + 695)/495 * 0.9;
% vpa(gn4,3)
% gd4 = (500*s^(12/5) + 1070*s^(11/10) + 230*s^(13/10) + 495)/495 * 0.9;
% vpa(gd4,3)

% syms s 
% a1 = 0.96;
% a2 = 0.97;
% be = 1.37;
% Lf = 0.0008;
% Rf = 0.05; 
% C = 0.0027;
% Rc = 1;
% L = 0.0005; 
% R = 0.8;
% Z1 = (s^a1)*Lf + Rf; 
% Z2 = 1/((s^be)*C) + Rc; 
% Z3 = (s^a2)*L + R;
% G = (Z2)/(Z1*Z2 + Z1*Z3 + Z2*Z3);
% H = 0.003 * G;
% 
% H = expand(H);
% H = simplify(H);
% H = vpa(H)
% 
% hn = (405000*s^(137/100) + 150000000)/(54 * s^(a1+a2+be));
% hn = expand(hn);
% hn = vpa(hn)
% %2777777.7777777777777777777777778/s^(33/10) + 7500.0/s^(193/100)
% hd = (54*s^(33/10) + 40000000*s^(24/25) + 70875*s^(117/50) + 25000000*s^(97/100) + 120150000*s^(137/100) + 194400*s^(233/100) + 42500000000)/(54 * s^(a1+a2+be));
% hd = expand(hd);
% hd = vpa(hd)
% %787037037.03703703703703703703704/s^(33/10) + 1312.5/s^(24/25) + 740740.74074074074074074074074074/s^(117/50) + 3600.0/s^(97/100) + 2225000.0/s^(193/100) + 462962.96296296296296296296296296/s^(233/100) + 1.0


% syms s
% n1 = 2777777.7777777777777777777777778; 
% n2 = 7500.0;
% d1 = 787037037.03703703703703703703704;
% d2 = 1312.5;
% d3 = 740740.74074074074074074074074074;
% d4 = 3600.0;
% d5 = 2225000.0;
% d6 = 462962.96296296296296296296296296;
% 
% % n1 = 2777777.78;
% % n2 = 7500.0;
% % d1 = 787037037.04;
% % d2 = 1312.5;
% % d3 = 740740.74;
% % d4 = 3600.0;
% % d5 = 2225000.0;
% % d6 = 462962.96;
% % 
% A= [-d2, 0, 0, -d2, 1, 0;
%     -d5, 0, 0, -d5, 0, 0;
%     -d1, 0, 0, -d1, 0, 0;
%     -d4, 1, 0, -d4, 0, 1;
%     -d6, 0, 0, -d6, 0, 0;    
%     -d3, 0, 1, -d3, 0, 0];
%     
% B =  [0; n2; n1; 0; 0; 0];
% 
% C =  [1, 0, 0, 1, 0, 0];
% 
% Z = [s^0.96,    0,    0,     0,     0,     0;
% 	     0,s^0.96,    0,     0,     0,     0;
%          0,     0,s^0.96,     0,     0,     0;
%          0,     0,    0, s^0.97,     0,     0;
%          0,     0,    0,     0, s^1.37,     0;
%          0,     0,    0,     0,     0, s^1.37]
% H1 = C* inv(eye(6) - Z*A) *Z*B;
% H1 = expand(H1);
% H1 = simplify(H1);
% H1 = vpa(H1)
% HN1 = (47721858844444448.0*s^(33/10) + 128849018880000.0*s^(193/100))/17179869184.0;
% HD1 = (13521193339259258880.0*s^(33/10) + 22548578304000.0*s^(24/25) + 12725829025185186.0*s^(117/50) + 61847529062400.0*s^(97/100) + 38225208934400000.0*s^(193/100) + 7953643140740741.0*s^(233/100) + 17179869184.0)/17179869184.0;
% vpa(HN1)
% vpa(HD1)
% 
% H = C * inv(Z - A) * B;
% H = expand(H);
% H = simplify(H);
% H = vpa(H)
% HN = (128849018880000.0*s^(137/100) + 47721858844444448.0)/13521193339259258880.0 * 42500000000;
% HD = (17179869184.0*s^(33/10) + 12725829025185186.0*s^(24/25) + 22548578304000.0*s^(117/50) + 7953643140740741.0*s^(97/100) + 38225208934400000.0*s^(137/100) + 61847529062400.0*s^(233/100) + 13521193339259258880.0)/13521193339259258880.0 * 42500000000;
% vpa(HN)
% vpa(HD)




