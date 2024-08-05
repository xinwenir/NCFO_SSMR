clc
clear
syms s

% GS = (0.96*s^1.59 + 1.2*s^1.2 + 2.4*s^0.39 + 3)/(3.3*s^2.27 + 2.4*s^1.77 + 0.96*s^1.59 + 1.2*s^1.2 + 5.7*s^0.97 + 1.2*s^0.47 + 2.4*s^0.39 + 3);
% GSN = 0.96*s^1.59 + 1.2*s^1.2 + 2.4*s^0.39 + 3;
% GSD = 3.3*s^2.27 + 2.4*s^1.77 + 0.96*s^1.59 + 1.2*s^1.2 + 5.7*s^0.97 + 1.2*s^0.47 + 2.4*s^0.39 + 3;
% Gs_n = expand(GSN / (3.3*s^2.27));
% 
% Gs_n = vpa(Gs_n,5)
% Gs_d = expand(GSD / (3.3*s^2.27));
% Gs_d = vpa(Gs_d,5)

% Gs_n = 0.29091/s^(17/25) + 0.72727/s^(47/25) + 0.36364/s^(107/100) + 0.90909/s^(227/100)
%  
% Gs_d = 0.72727/s^(1/2) + 0.36364/s^(9/5) + 1.7273/s^(13/10) + 0.29091/s^(17/25) + 0.72727/s^(47/25) + 0.36364/s^(107/100) + 0.90909/s^(227/100) + 1.0
% A = [-0.83, 0,  0,  0,  -0.83,  0;
%     -0.39,  0,  0,  0,  -0.39,  0;
%     0,  0,  -0.46,  0,  0,  -0.46;
%     0,  0,  -0.99,  0,  0,  -0.99;
%     -0.47,  1,  0,  0,  -0.47,  0;
%     0,  0,  -2.14,  1,  0,  -2.14];
% C = [1, 0,  0,  0,  1,  0;
%      0, 0,  1,  0,  0,  1];
% B = [0, 1.67;
%     0.56,   0.78;
%     0,  1.54;
%     1.98,   3.3;
%     0.67,   0;
%     4.29,   0];
% r = [4, 1, 1];

% A = [0, 0,     0, 0, 1, 0, 0, 0;
%      0, 0,     0, 0, 0, 0, 0, 0;
%      1, 0,  -3.1, 1, 0, 0, 0, 0;
%      0, 1, -2.89, 0, 0, 0, 0, 0;
%      0, 0,  -2.5, 0, 0, 1, 0, 1;
%      0, 0,     0, 0, 0, 0, 1, 0;
%      0, 0,  -1.2, 0, 0, 0, 0, 0;
%      0, 0,     0, 0, 0, 0, 0, 0];
% 
% B = [0; 0; 0; 0; 0; 0; 2; 5];
% 
% C = [0,  0,  1,  0,  0,  0,  0,  0];
% 
% D = 0;
% A = [0, 0,     0, 0, 1, 0, 0, 0;
%      0, 0,  -2.5, 0, 0, 1, 0, 1;
%      1, 0,  -3.1, 1, 0, 0, 0, 0;
%      0, 1, -2.89, 0, 0, 0, 0, 0;
%      0, 0,     0, 0, 0, 0, 0, 0;
%      0, 0,     0, 0, 0, 0, 1, 0;
%      0, 0,  -1.2, 0, 0, 0, 0, 0;
%      0, 0,     0, 0, 0, 0, 0, 0];
% 
% B = [0; 0; 0; 0; 0; 0; 2; 5];
% 
% C = [0,  0,  1,  0,  0,  0,  0,  0];
% 
% D = 0;
% r = [2, 5, 1];
% Ops = [s^0.5, s^0.7, s^0.8];

% A = [	
%    -8,	1,	0,	0,	0,	0,	0, -8,	0,	0, -8,	0,	0;	
% 	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0;
%   -26,	0,	0,	0,	0,	0,	0,-26,	0,	0,-26,	0,	0;
% 	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1;
% 	0,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0;
% 	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0;
%   -90,	0,	0,	0,	0,	0,	0,-90,	0,	1,-90,	0,	0;
% 	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	0;
% 	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0;
% 	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0;
% 	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0;
% 	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0;
%   -73,	0,	0,	0,	0,	0,	0,-73,	0,	0,-73,	0,	0];
% 
% B = [0;	0;	0;	0;	0;	0;	0;	0;	0;	1;	0;	0;	0];
% 
% C = [1,	0,	0,	0,	0,	0,	0,	1,	0,	0,	1,	0,	0];
% 
% D = 0;
% 
% r = [7,	3,	3];
% Ops = [s^0.4, s^0.5, s^0.9];

% A = [	
%    -8,	0,	1,	0,	0, -8,	0,	0,	0;	
% 	0,	0,	0,	0,	0,	0,	1,	0,	0;
%     0,	0,	0,	1,	0,  0,	0,	1,	0;
% 	0,	0,	0,	0,	0,	0,	0,	0,	0;
%   -90,	0,	0,	0,	0,-90,	0,	0,	0;
%   -26,	1,	0,	0,	0,-26,	0,	0,	0;
%     0,	0,	0,	0,	0,  0,	0,	0,	0;
%   -73,	0,	0,	0,	1,-73,	0,	0,	1;
% 	0,	0,	0,	0,	0,	0,	0,	0,	0];
% 
% B = [0;	0;	0;	0;	0;	0;	0;	0;	1];
% 
% C = [1,	0,	0,	0,	0,	1,	0,	0,	0];
% 
% D = 0;
% 
% r = [2,	3,	4];
% Ops = [s^0.4, s^0.7, s^1.2];

A0 = [	
   -8,	0,	1,	0,	0, -8,	0,	0,	0;	
	0,	0,	0,	0,	0,	0,	1,	0,	0;
    0,	0,	0,	1,	0,  0,	0,	1,	0;
	0,	0,	0,	0,	0,	0,	0,	0,	0;
  -90,	0,	0,	0,	0,-90,	0,	0,	0;
  -26,	1,	0,	0,	0,-26,	0,	0,	0;
    0,	0,	0,	0,	0,  0,	0,	0,	0;
  -73,	0,	0,	0,	1,-73,	0,	0,	1;
	0,	0,	0,	0,	0,	0,	0,	0,	0];

B0 = [0;	0;	0;	0;	0;	0;	0;	0;	1];

C0 = [1,	0,	0,	0,	0,	1,	0,	0,	0];

D = 0;

r = [2,	3,	4];
Ops = [s^0.4, s^0.7, s^1.2];
A = A0';
B = C0';
C = B0';

OpsNum = numel(Ops);
Z = [];
for i = 1 : OpsNum
    Z = blkdiag(Z, Ops(i)*eye(r(i)));       % calculate Z.
end
% Z = [s^0.5,   0,   0,     0,     0,     0,     0,     0;
% 	   0, s^0.5,   0,     0,     0,     0,     0,     0;
% 	   0,   0, s^0.7,     0,     0,     0,     0,     0;
%        0,   0,     0, s^0.7,     0,     0,     0,     0;
%        0,   0,     0,     0, s^0.7,     0,     0,     0;
%        0,   0,     0,     0,     0, s^0.7,     0,     0;
%        0,   0,     0,     0,     0,     0, s^0.7,     0;
%        0,   0,     0,     0,     0,     0,     0, s^0.8];

H1 = C* inv(eye(9) - Z*A)*Z*B + D;

simplify(H1)

H = C* inv(Z - A)*B + D;

simplify(H)




% A = [-1, 1, -1, 0, 3, 2, 0, 0, 1, 0;
%      -2, 1, -3, 0, 1, 4, 0, -1, 1, 1;
%      -2, 0, 4, 1, 1, 0, 1, 0, 2, 0;
%      -4, 2, -4, 1, 7, 8, 1, 4, 2, 0;
%      -1, 1, 0, 0, 3, 2, 0, 0, 1, -1;
%      -1, 0, 0, 0, -2, 3, 0, 0, 0, 0;
%      -3, -1, 0, 2, 1, -2, 4, 0, -3, -1;
%       1, 0, 1, 0, 1, -1, -1, 2, 2, 1;
%      -2, 0, 1, 1, 1, 2, 1, 2, 1, 0;
%       0, 0, -1, 0, 0, 0, 0, 0, 0, 1];
% 
% B = [1; 1;  1;  1;  -1; 0;  -1; 1;  0;  1];
% 
% C = [-2,  0,  0,  1,  2,  0,  2,  0,  1,  1;
%       0,  0,  1,  0,  0,  1,  0,  1,  0,  1];
% r = [4, 4, 2];
for i = 1 : length(r)
    for j = 1 : length(r)
        if i == j
            v_q = eye(r(j));
        else
            v_q = zeros(r(j));
        end 
        if j == 1
            Vv_q = v_q;
        else
            Vv_q = blkdiag(Vv_q,v_q);
        end
    end
    Vv(:,:,i) = Vv_q;
end
for i = 1 : length(r) 
    Ac(:,:,i) = A * Vv(:,:,i);
    Cc(:,:,i) = C * Vv(:,:,i);
    Ar(:,:,i) = Vv(:,:,i) * A;
    Br(:,:,i) = Vv(:,:,i) * B;
end

% v1 = eye(4);
% v2 = 0;
% v3 = 0;
% Vv1 = blkdiag(v1,v2,v3);
% v1 = zeros(4);
% v2 = 1;
% v3 = 0;
% Vv2 = blkdiag(v1,v2,v3);
% v1 = zeros(4);
% v2 = 0;
% v3 = 1;
% Vv3 = blkdiag(v1,v2,v3);
% 
% Ac1 = A * Vv1;
% Ac2 = A * Vv2;
% Ac3 = A * Vv3;
% 
% Cc1 = C * Vv1;
% Cc2 = C * Vv2;
% Cc3 = C * Vv3;
% 
% Ar1 = Vv1 * A;
% Ar2 = Vv2 * A;
% Ar3 = Vv3 * A;
% 
% Br1 = Vv1 * B;
% Br2 = Vv2 * B;
% Br3 = Vv3 * B;

for i = 1 : length(r)
    eigDc(:, i) = eig(Ac(:,:,i));
    eigDr(:, i) = eig(Ar(:,:,i));
end

rk = 1;
[r_eigDc,c_eigDc] = size(eigDc);
r_szero = zeros(length(r),1);
for i = 1 : length(r)
    eigDc_szero_q = 0;
    for j = 1 : r_eigDc       
        if eigDc(j,i) ~= 0.0
            eigDc_szero_q = [eigDc_szero_q; eigDc(j,i)];
        end
    end
%     eigDc_szero_q
    r_szero(i) = length(eigDc_szero_q);
    if i == 1
        eigDc_szero = eigDc_szero_q;
        rk = r_szero(i);
    else
        kk = 1;
        eigDc_szero_q2 = zeros(rk * r_szero(i), i);
        for rki = 1 : rk
            for ri = 1 : r_szero(i)
                eigDc_szero_q2(kk,:) = [eigDc_szero(rki,:), eigDc_szero_q(ri)]; 
                kk = kk + 1;
            end
        end
        rk = kk - 1;
        eigDc_szero = eigDc_szero_q2;
    end
end
[r_eigDc_szero,c_eigDc_szero] = size(eigDc_szero);
[n,] = size(A);
Ir = eye(n);
cnt = 1;
for i = 1 : r_eigDc_szero
    for j = 1 : length(r)
        lami = eigDc_szero(i,j);
        Ac_q = Ac(:,:,j) - lami * Ir;
        Cc_q = Cc(:,:,j);
        if j == 1
            Ac_q2 = Ac_q;
            Cc_q2 = Cc_q; 
        else 
            Ac_q2 = [Ac_q2;Ac_q];
            Cc_q2 = [Cc_q2;Cc_q];
        end
    end
    Mc_q = [Ac_q2;Cc_q2];
    if rank(Mc_q) < n
        Mc(:,:,cnt) = Mc_q;
        cnt = cnt + 1;
    end
end
Mc

rk = 1;
[r_eigDr,c_eigDr] = size(eigDr);
r_szero = zeros(length(r),1);
for i = 1 : length(r)
    eigDr_szero_q = 0;
    for j = 1 : r_eigDr       
        if eigDr(j,i) ~= 0.0
            eigDr_szero_q = [eigDr_szero_q; eigDr(j,i)];
        end
    end
%     eigDc_szero_q
    r_szero(i) = length(eigDr_szero_q);
    if i == 1
        eigDr_szero = eigDr_szero_q;
        rk = r_szero(i);
    else
        kk = 1;
        eigDr_szero_q2 = zeros(rk * r_szero(i), i);
        for rki = 1 : rk
            for ri = 1 : r_szero(i)
                eigDr_szero_q2(kk,:) = [eigDr_szero(rki,:), eigDr_szero_q(ri)]; 
                kk = kk + 1;
            end
        end
        rk = kk - 1;
        eigDr_szero = eigDr_szero_q2;
    end
end
[r_eigDr_szero,c_eigDr_szero] = size(eigDr_szero);
[n,] = size(A);
Ir = eye(n);
cnt = 1;
for i = 1 : r_eigDr_szero
    for j = 1 : length(r)
        lami = eigDr_szero(i,j);
        Ar_q = Ar(:,:,j) - lami * Ir;
        Br_q = Br(:,:,j);
        if j == 1
            Ar_q2 = Ar_q;
            Br_q2 = Br_q; 
        else 
            Ar_q2 = [Ar_q2, Ar_q];
            Br_q2 = [Br_q2, Br_q];
        end
    end
    Mr_q = [Ar_q2, Br_q2];
    if rank(Mr_q') < n
        Mr(:,:,cnt) = Mr_q;
        cnt = cnt + 1;
    end
end
% Mr

V = [ 
    0, 0, 1, 0, 0, 0, 0, 0, 0;
    0, 0, 0, 1, 0, 0, 0, 0, 0;
    0, 0, 0, 0, 1, 0, 0, 0, 0;
    1, 0, 0, 0, 0, 0, 0, 0, 0;
    0, 0, 0, 0, 0, 1, 0, 0, 0;
    0, 0, 0, 0, 0, 0, 1, 0, 0;
    0, 1, 0, 0, 0, 0, 0, 0, 0;
    0, 0, 0, 0, 0, 0, 0, 1, 0;
    0, 0, 0, 0, 0, 0, 0, 0, 1];

V1 = inv(V)

% A = [-1, 1, -1, 0, 3, 2, 0, 0, 1, 0;
%      -2, 1, -3, 0, 1, 4, 0, -1, 1, 1;
%      -2, 0, 4, 1, 1, 0, 1, 0, 2, 0;
%      -4, 2, -4, 1, 7, 8, 1, 4, 2, 0;
%      -1, 1, 0, 0, 3, 2, 0, 0, 1, -1;
%      -1, 0, 0, 0, -2, 3, 0, 0, 0, 0;
%      -3, -1, 0, 2, 1, -2, 4, 0, -3, -1;
%       1, 0, 1, 0, 1, -1, -1, 2, 2, 1;
%      -2, 0, 1, 1, 1, 2, 1, 2, 1, 0;
%       0, 0, -1, 0, 0, 0, 0, 0, 0, 1];
% 
% B = [1; 1;  1;  1;  -1; 0;  -1; 1;  0;  1];
% 
% C = [-2,  0,  0,  1,  2,  0,  2,  0,  1,  1;
%       0,  0,  1,  0,  0,  1,  0,  1,  0,  1];
% 
% v1 = eye(4);
% v2 = zeros(4);
% v3 = zeros(2);
% Vv1 = blkdiag(v1,v2,v3);
% 
% v1 = zeros(4);
% v2 = eye(4);
% v3 = zeros(2);
% Vv2 = blkdiag(v1,v2,v3);
% 
% v1 = zeros(4);
% v2 = zeros(4);
% v3 = eye(2);
% Vv3 = blkdiag(v1,v2,v3);
% 
% Ac1 = A * Vv1;
% Ac2 = A * Vv2;
% Ac3 = A * Vv3;
% 
% Cc1 = C * Vv1;
% Cc2 = C * Vv2;
% Cc3 = C * Vv3;
% 
% Ar1 = Vv1 * A;
% Ar2 = Vv2 * A;
% Ar3 = Vv3 * A;
% 
% Br1 = Vv1 * B;
% Br2 = Vv2 * B;
% Br3 = Vv3 * B;
% 
% eigD1 = eig(Ac1);
% eigD2 = eig(Ac2);
% eigD3 = eig(Ac3);
% 
% k = 1;
% 
% eigD1_szero = 0;
% for i = 1 : length(eigD1) 
%     if eigD1(i) == 0
%         k = 1;
%     else
%         eigD1_szero = [eigD1_szero;eigD1(i)];
%     end   
% end
% eigD2_szero = 0;
% for i = 1 : length(eigD2) 
%     if eigD2(i) == 0
%         k = 1;
%     else
%         eigD2_szero = [eigD2_szero;eigD2(i)];
%     end   
% end
% eigD3_szero = 0;
% for i = 1 : length(eigD3) 
%     if eigD3(i) == 0
%         k = 1;
%     else
%         eigD3_szero = [eigD3_szero;eigD3(i)];
%     end   
% end
% [r,] = size(A);
% Ir = eye(r);
% kk = 1;
% Mc = 0;
% for e1i = 1 : length(eigD1_szero)
%     for e2i = 1 : length(eigD2_szero)
%         for e3i = 1 : length(eigD3_szero) 
%             lam1 = eigD1_szero(e1i);
%             lam2 = eigD2_szero(e2i);
%             lam3 = eigD3_szero(e3i);
%             Mc_q = [(Ac1 - lam1 * Ir);
%                   (Ac2 - lam2 * Ir);
%                   (Ac3 - lam3 * Ir);
%                   Cc1;
%                   Cc2;
%                   Cc3];
%             if rank(Mc_q) < r 
%                 Mc = Mc_q
%             end
%             
%         end
%     end
% end
% 
% eigDr1 = eig(Ar1);
% eigDr2 = eig(Ar2);
% eigDr3 = eig(Ar3);
% 
% k = 1;
% 
% eigDr1_szero = 0;
% for i = 1 : length(eigDr1) 
%     if eigDr1(i) == 0
%         k = 1;
%     else
%         eigDr1_szero = [eigDr1_szero;eigDr1(i)];
%     end   
% end
% eigDr2_szero = 0;
% for i = 1 : length(eigDr2) 
%     if eigDr2(i) == 0
%         k = 1;
%     else
%         eigDr2_szero = [eigDr2_szero;eigDr2(i)];
%     end   
% end
% eigDr3_szero = 0;
% for i = 1 : length(eigDr3) 
%     if eigDr3(i) == 0
%         k = 1;
%     else
%         eigDr3_szero = [eigDr3_szero;eigDr3(i)];
%     end   
% end
% [r,] = size(A);
% Ir = eye(r);
% kk = 1;
% Mc = 0;
% for e1i = 1 : length(eigDr1_szero)
%     for e2i = 1 : length(eigDr2_szero)
%         for e3i = 1 : length(eigDr3_szero) 
%             lam1 = eigDr1_szero(e1i);
%             lam2 = eigDr2_szero(e2i);
%             lam3 = eigDr3_szero(e3i);
%             Mr_q = [(Ar1 - lam1 * Ir), (Ar2 - lam2 * Ir), (Ar3 - lam3 * Ir), Br1, Br2, Br3];
%             if rank(Mr_q') < r 
%                 Mr = Mr_q
%             end
%             
%         end
%     end
% end

    

