function [w, w_qf, qsp, w_lf,lsp] = w_gen_com(gam,h,Thn,L_linear,L_quadratic) % The minimum value of L is 256
t = h : h : Thn;
w = 1.0;
% Lend = 4096;
if exist("Lend","var")
    for j = 2 : Lend % w_0 = 1, w_j = (1 - (\alpha + 1)/j)w_{j-1}, j = 1,2,....
        w(j) = w(j - 1)*(1-(gam + 1)/(j - 1));
    end
else
    for j = 2 : length(t) % w_0 = 1, w_j = (1 - (\alpha + 1)/j)w_{j-1}, j = 1,2,....
        w(j) = w(j - 1)*(1-(gam + 1)/(j - 1));
    end
end
w_qf = ones(1,length(t));
w_lf = ones(1,length(t));
qsp = 0;
lsp = 0;

L0 = 32;
L1 = 2 * L0; %128 - 64
L2 = 2 * L1; %512 - 128
L3 = 4 * L2; %2048 -512
L4 = 4 * L3; %4096 -2048
L5 = 2 * L4; %8192
L6 = 2 * L5; %16384
L7 = 2 * L6; %32768

%% 二次项拟合
[qfres0, ] = createFit_Quadratic(t(L0 : L1 - 1), w(L0 : L1 - 1));    % 32  ----> 128
[qfres1, ] = createFit_Quadratic(t(L1 : L2 - 1), w(L1 : L2 - 1));    % 128  ----> 512
[qfres2, ] = createFit_Quadratic(t(L2 : L3 - 1), w(L2 : L3 - 1));    % 512 ----> 2048
if     L_quadratic == L3 %2k  - 32bit
    [qfres3, ] = createFit_Quadratic(t(L3 : end), w(L3 : end));      % 2048 ----> end
elseif L_quadratic == L4 %4k -  32bit
    [qfres3, ] = createFit_Quadratic(t(L3 : L4 - 1), w(L3 : L4 - 1));% 256 ----> 511
    [qfres4, ] = createFit_Quadratic(t(L4 : end), w(L4 : end));      % 512 ----> end
elseif L_quadratic == L5 %8k  - 32it
    [qfres3, ] = createFit_Quadratic(t(L3 : L4 - 1), w(L3 : L4 - 1));% 256  ----> 511
    [qfres4, ] = createFit_Quadratic(t(L4 : L5 - 1), w(L4 : L5 - 1));% 512  ----> 1023
    [qfres5, ] = createFit_Quadratic(t(L5 : end), w(L5 : end));      % 1024 ----> end
elseif L_quadratic == L6 %16k - 32bit
    [qfres3, ] = createFit_Quadratic(t(L3 : L4 - 1), w(L3 : L4 - 1));% 256  ----> 511
    [qfres4, ] = createFit_Quadratic(t(L4 : L5 - 1), w(L4 : L5 - 1));% 512  ----> 1023
    [qfres5, ] = createFit_Quadratic(t(L5 : L6 - 1), w(L5 : L6 - 1));% 1024 ----> 2047
    if exist("Lend","var")
        [qfres6, ] = createFit_Quadratic(t(L6 : Lend), w(L6 : Lend));      % 2048 ----> end
    else
        [qfres6, ] = createFit_Quadratic(t(L6 : end), w(L6 : end));      % 2048 ----> end
    end
elseif L_quadratic == L7 %32k-32bit
    [qfres3, ] = createFit_Quadratic(t(L3 : L4 - 1), w(L3 : L4 - 1));% 256  ----> 511
    [qfres4, ] = createFit_Quadratic(t(L4 : L5 - 1), w(L4 : L5 - 1));% 512  ----> 1023
    [qfres5, ] = createFit_Quadratic(t(L5 : L6 - 1), w(L5 : L6 - 1));% 1024 ----> 2047
    [qfres6, ] = createFit_Quadratic(t(L6 : L7 - 1), w(L6 : L7 - 1));% 2048 ----> 4095
    [qfres7, ] = createFit_Quadratic(t(L7 : end), w(L7 : end));      % 4096 ----> end
end


qs0p = [qfres0.p1,qfres0.p2,qfres0.p3];
qs1p = [qfres1.p1,qfres1.p2,qfres1.p3];
qs2p = [qfres2.p1,qfres2.p2,qfres2.p3];
if     L_quadratic == L3
    qs3p = [qfres3.p1,qfres3.p2,qfres3.p3];% 256 ----> end
elseif L_quadratic == L4
    qs3p = [qfres3.p1,qfres3.p2,qfres3.p3];% 256 ----> 512
    qs4p = [qfres4.p1,qfres4.p2,qfres4.p3];% 512 ----> end
elseif L_quadratic == L5
    qs3p = [qfres3.p1,qfres3.p2,qfres3.p3];% 256  ----> 512
    qs4p = [qfres4.p1,qfres4.p2,qfres4.p3];% 512  ----> 1024
    qs5p = [qfres5.p1,qfres5.p2,qfres5.p3];% 1024 ----> end
elseif L_quadratic == L6
    qs3p = [qfres3.p1,qfres3.p2,qfres3.p3];% 256  ----> 512
    qs4p = [qfres4.p1,qfres4.p2,qfres4.p3];% 512  ----> 1024
    qs5p = [qfres5.p1,qfres5.p2,qfres5.p3];% 1024 ----> 2048
    qs6p = [qfres6.p1,qfres6.p2,qfres6.p3];% 2048 ----> end
elseif L_quadratic == L7
    qs3p = [qfres3.p1,qfres3.p2,qfres3.p3];% 256  ----> 512
    qs4p = [qfres4.p1,qfres4.p2,qfres4.p3];% 512  ----> 1024
    qs5p = [qfres5.p1,qfres5.p2,qfres5.p3];% 1024 ----> 2048
    qs6p = [qfres6.p1,qfres6.p2,qfres6.p3];% 2048 ----> 4096
    qs7p = [qfres7.p1,qfres7.p2,qfres7.p3];% 4096 ----> end
end

if     L_quadratic == L3
    qsp = [qs0p; qs1p; qs2p; qs3p];% 256 ----> end
elseif L_quadratic == L4
    qsp = [qs0p; qs1p; qs2p; qs3p; qs4p];% 512 ----> end
elseif L_quadratic == L5
    qsp = [qs0p; qs1p; qs2p; qs3p; qs4p; qs5p];% 1024 ----> end
elseif L_quadratic == L6
    qsp = [qs0p; qs1p; qs2p; qs3p; qs4p; qs5p; qs6p];% 2048 ----> end
elseif L_quadratic == L7
    qsp = [qs0p; qs1p; qs2p; qs3p; qs4p; qs5p; qs6p; qs7p];% 4096 ----> end
end


if     L_quadratic == L3
    % 256 ----> end
    for i = L0 : length(t)
        if     i >= L0 && i < L1
            w_qf(L0 : L1 - 1) = qfres0.p1 .* (t(L0 : L1 - 1) .* t(L0 : L1 - 1)) + qfres0.p2 .* t(L0 : L1 - 1)  + qfres0.p3;
        elseif i >= L1 && i < L2
            w_qf(L1 : L2 - 1) = qfres1.p1 .* (t(L1 : L2 - 1) .* t(L1 : L2 - 1)) + qfres1.p2 .* t(L1 : L2 - 1) + qfres1.p3;
        elseif i >= L2 && i < L3
            w_qf(L2 : L3 - 1) = qfres2.p1 .* (t(L2 : L3 - 1) .* t(L2 : L3 - 1)) + qfres2.p2 .* t(L2 : L3 - 1) + qfres2.p3;
        elseif i >= L3 %256
            w_qf(L3 : end) = qfres3.p1 .* (t(L3 : end) .* t(L3 : end)) + qfres3.p2 .* t(L3 : end) + qfres3.p3;
        end
    end
elseif L_quadratic == L4
    % 512 ----> end
    for i = L0 : length(t)
        if     i >= L0 && i < L1
            w_qf(L0 : L1 - 1) = qfres0.p1 .* (t(L0 : L1 - 1) .* t(L0 : L1 - 1)) + qfres0.p2 .* t(L0 : L1 - 1)  + qfres0.p3;
        elseif i >= L1 && i < L2
            w_qf(L1 : L2 - 1) = qfres1.p1 .* (t(L1 : L2 - 1) .* t(L1 : L2 - 1)) + qfres1.p2 .* t(L1 : L2 - 1) + qfres1.p3;
        elseif i >= L2 && i < L3
            w_qf(L2 : L3 - 1) = qfres2.p1 .* (t(L2 : L3 - 1) .* t(L2 : L3 - 1)) + qfres2.p2 .* t(L2 : L3 - 1) + qfres2.p3;
        elseif i >= L3 && i < L4
            w_qf(L3 : L4 - 1) = qfres3.p1 .* (t(L3 : L4 - 1) .* t(L3 : L4 - 1)) + qfres3.p2 .* t(L3 : L4 - 1) + qfres3.p3;
        elseif i >= L4 %512
            w_qf(L4 : end) = qfres4.p1 .* (t(L4 : end) .* t(L4 : end)) + qfres4.p2 .* t(L4 : end) + qfres4.p3;
        end
    end
elseif L_quadratic == L5
    % 1024 ----> end
    for i = L0 : length(t)
        if     i >= L0 && i < L1
            w_qf(L0 : L1 - 1) = qfres0.p1 .* (t(L0 : L1 - 1) .* t(L0 : L1 - 1)) + qfres0.p2 .* t(L0 : L1 - 1)  + qfres0.p3;
        elseif i >= L1 && i < L2
            w_qf(L1 : L2 - 1) = qfres1.p1 .* (t(L1 : L2 - 1) .* t(L1 : L2 - 1)) + qfres1.p2 .* t(L1 : L2 - 1) + qfres1.p3;
        elseif i >= L2 && i < L3
            w_qf(L2 : L3 - 1) = qfres2.p1 .* (t(L2 : L3 - 1) .* t(L2 : L3 - 1)) + qfres2.p2 .* t(L2 : L3 - 1) + qfres2.p3;
        elseif i >= L3 && i < L4
            w_qf(L3 : L4 - 1) = qfres3.p1 .* (t(L3 : L4 - 1) .* t(L3 : L4 - 1)) + qfres3.p2 .* t(L3 : L4 - 1) + qfres3.p3;
        elseif i >= L4 && i < L5
            w_qf(L4 : L5 - 1) = qfres4.p1 .* (t(L4 : L5 - 1) .* t(L4 : L5 - 1)) + qfres4.p2 .* t(L4 : L5 - 1) + qfres4.p3;
        elseif i >= L5 %1024
            w_qf(L5 : end) = qfres5.p1 .* (t(L5 : end) .* t(L5 : end)) + qfres5.p2 .* t(L5 : end) + qfres5.p3;
        end
    end
elseif L_quadratic == L6
    % 2048 ----> end
    for i = L0 : length(t)
        if     i >= L0 && i < L1
            w_qf(L0 : L1 - 1) = qfres0.p1 .* (t(L0 : L1 - 1) .* t(L0 : L1 - 1)) + qfres0.p2 .* t(L0 : L1 - 1)  + qfres0.p3;
        elseif i >= L1 && i < L2
            w_qf(L1 : L2 - 1) = qfres1.p1 .* (t(L1 : L2 - 1) .* t(L1 : L2 - 1)) + qfres1.p2 .* t(L1 : L2 - 1) + qfres1.p3;
        elseif i >= L2 && i < L3
            w_qf(L2 : L3 - 1) = qfres2.p1 .* (t(L2 : L3 - 1) .* t(L2 : L3 - 1)) + qfres2.p2 .* t(L2 : L3 - 1) + qfres2.p3;
        elseif i >= L3 && i < L4
            w_qf(L3 : L4 - 1) = qfres3.p1 .* (t(L3 : L4 - 1) .* t(L3 : L4 - 1)) + qfres3.p2 .* t(L3 : L4 - 1) + qfres3.p3;
        elseif i >= L4 && i < L5
            w_qf(L4 : L5 - 1) = qfres4.p1 .* (t(L4 : L5 - 1) .* t(L4 : L5 - 1)) + qfres4.p2 .* t(L4 : L5 - 1) + qfres4.p3;
        elseif i >= L5 && i < L6
            w_qf(L5 : L6 - 1) = qfres5.p1 .* (t(L5 : L6 - 1) .* t(L5 : L6 - 1)) + qfres5.p2 .* t(L5 : L6 - 1) + qfres5.p3;
        elseif i >= L6 %2048
            if exist("Lend","var")
                w_qf(L6 : Lend) = qfres6.p1 .* (t(L6 : Lend) .* t(L6 : Lend)) + qfres6.p2 .* t(L6 : Lend) + qfres6.p3;
            else
                w_qf(L6 : end) = qfres6.p1 .* (t(L6 : end) .* t(L6 : end)) + qfres6.p2 .* t(L6 : end) + qfres6.p3;
            end
        end
    end
elseif L_quadratic == L7
    % 4096 ----> end
    for i = L0 : length(t)
        if     i >= L0 && i < L1
            w_qf(L0 : L1 - 1) = qfres0.p1 .* (t(L0 : L1 - 1) .* t(L0 : L1 - 1)) + qfres0.p2 .* t(L0 : L1 - 1)  + qfres0.p3;
        elseif i >= L1 && i < L2
            w_qf(L1 : L2 - 1) = qfres1.p1 .* (t(L1 : L2 - 1) .* t(L1 : L2 - 1)) + qfres1.p2 .* t(L1 : L2 - 1) + qfres1.p3;
        elseif i >= L2 && i < L3
            w_qf(L2 : L3 - 1) = qfres2.p1 .* (t(L2 : L3 - 1) .* t(L2 : L3 - 1)) + qfres2.p2 .* t(L2 : L3 - 1) + qfres2.p3;
        elseif i >= L3 && i < L4
            w_qf(L3 : L4 - 1) = qfres3.p1 .* (t(L3 : L4 - 1) .* t(L3 : L4 - 1)) + qfres3.p2 .* t(L3 : L4 - 1) + qfres3.p3;
        elseif i >= L4 && i < L5
            w_qf(L4 : L5 - 1) = qfres4.p1 .* (t(L4 : L5 - 1) .* t(L4 : L5 - 1)) + qfres4.p2 .* t(L4 : L5 - 1) + qfres4.p3;
        elseif i >= L5 && i < L6
            w_qf(L5 : L6 - 1) = qfres5.p1 .* (t(L5 : L6 - 1) .* t(L5 : L6 - 1)) + qfres5.p2 .* t(L5 : L6 - 1) + qfres5.p3;
        elseif i >= L6 && i < L7
            w_qf(L6 : L7 - 1) = qfres6.p1 .* (t(L6 : L7 - 1) .* t(L6 : L7 - 1)) + qfres6.p2 .* t(L6 : L7 - 1) + qfres6.p3;
        elseif i >= L7 %4096
            w_qf(L7 : end) = qfres7.p1 .* (t(L7 : end) .* t(L7 : end)) + qfres7.p2 .* t(L7 : end) + qfres7.p3;
        end
    end
end

w_qf(1 : L0 - 1) = w(1 : L0 - 1);

%% 线性拟合
L02=8;
L01= 16;
L0 = 32;
L1 = 2 * L0; %64
L2 = 2 * L1; %128
L3 = 2 * L2; %256
L4 = 2 * L3; %512
L5 = 2 * L4; %1024
L6 = 2 * L5; %2048
L7 = 2 * L6; %4096

[lfres02, ] = createFit_Linear(t(1 + 1 : L02), w(1 + 1 : L02));% 2   ----> 8
[lfres01, ] = createFit_Linear(t(L02 + 1 : L01), w(L02 + 1 : L01));% 8   ----> 16
[lfres0, ] = createFit_Linear(t(L01 + 1 : L0), w(L01 + 1 : L0));% 16   ----> 32
[lfres1, ] = createFit_Linear(t(L0 + 1 : L1), w(L0 + 1 : L1));% 32   ----> 64
[lfres2, ] = createFit_Linear(t(L1 + 1 : L2), w(L1 + 1 : L2));% 64   ----> 128
[lfres3, ] = createFit_Linear(t(L2 + 1 : L3), w(L2 + 1 : L3));% 128   ----> 256
if     L_linear == 256
    [lfres4, ] = createFit_Linear(t(L3 + 1 : end), w(L3 + 1 : end));% 256 ----> end
elseif L_linear == 512
    [lfres4, ] = createFit_Linear(t(L3 + 1 : L4), w(L3 + 1 : L4));% 256   ----> 512
    [lfres5, ] = createFit_Linear(t(L4 + 1 : end), w(L4 + 1 : end));% 512   ----> end
elseif L_linear == 1024
    [lfres4, ] = createFit_Linear(t(L3 + 1 : L4), w(L3 + 1 : L4));% 256   ----> 512
    [lfres5, ] = createFit_Linear(t(L4 + 1 : L5), w(L4 + 1 : L5));% 512   ----> 1024
    [lfres6, ] = createFit_Linear(t(L5 + 1 : end), w(L5 + 1 : end));% 1024   ----> end
elseif L_linear == 2048
    [lfres4, ] = createFit_Linear(t(L3 + 1 : L4), w(L3 + 1 : L4));% 256   ----> 512
    [lfres5, ] = createFit_Linear(t(L4 + 1 : L5), w(L4 + 1 : L5));% 512   ----> 1024
    [lfres6, ] = createFit_Linear(t(L5 + 1 : L6), w(L5 + 1 : L6));% 1024   ----> 2048
    if exist("Lend","var")
        [lfres7, ] = createFit_Linear(t(L6 + 1 : Lend), w(L6 + 1 : Lend));% 2048   ----> end
    else
        [lfres7, ] = createFit_Linear(t(L6 + 1 : end), w(L6 + 1 : end));% 2048   ----> end
    end
elseif L_linear == 4096
    [lfres4, ] = createFit_Linear(t(L3 + 1 : L4), w(L3 + 1 : L4));% 256   ----> 512
    [lfres5, ] = createFit_Linear(t(L4 + 1 : L5), w(L4 + 1 : L5));% 512   ----> 1024
    [lfres6, ] = createFit_Linear(t(L5 + 1 : L6), w(L5 + 1 : L6));% 1024   ----> 2048
    [lfres7, ] = createFit_Linear(t(L6 + 1 : L7), w(L6 + 1 : L7));% 2048   ----> 4096
    [lfres8, ] = createFit_Linear(t(L7 + 1 : end), w(L7 + 1 : end));% 4096   ----> end
end


ls02p = [lfres02.p1,lfres02.p2];% 2 ----> 8
ls01p = [lfres01.p1,lfres01.p2];% 8 ----> 16
ls0p = [lfres0.p1,lfres0.p2];   % 16 ----> 32
ls1p = [lfres1.p1,lfres1.p2];   % 32 ----> 64
ls2p = [lfres2.p1,lfres2.p2];   % 64 ----> 128
ls3p = [lfres3.p1,lfres3.p2];   % 128 ----> 256
if     L_linear == 256
    ls4p = [lfres4.p1,lfres4.p2];   % 256 ----> end
elseif L_linear == 512
    ls4p = [lfres4.p1,lfres4.p2];   % 256 ----> 512
    ls5p = [lfres5.p1,lfres5.p2];   % 512 ----> end
elseif L_linear == 1024
    ls4p = [lfres4.p1,lfres4.p2];   % 256 ----> 512
    ls5p = [lfres5.p1,lfres5.p2];   % 512 ----> 1024
    ls6p = [lfres6.p1,lfres6.p2];   % 1024   ----> end
elseif L_linear == 2048
    ls4p = [lfres4.p1,lfres4.p2];   % 256 ----> 512
    ls5p = [lfres5.p1,lfres5.p2];   % 512 ----> 1024
    ls6p = [lfres6.p1,lfres6.p2];   % 1024 ----> 2048
    ls7p = [lfres7.p1,lfres7.p2];   % 2048   ----> end
elseif L_linear == 4096
    ls4p = [lfres4.p1,lfres4.p2];   % 256 ----> 512
    ls5p = [lfres5.p1,lfres5.p2];   % 512 ----> 1024
    ls6p = [lfres6.p1,lfres6.p2];   % 1024 ----> 2048
    ls7p = [lfres7.p1,lfres7.p2];   % 2048 ----> 4096
    ls8p = [lfres8.p1,lfres8.p2];   % 4096 ----> end
end

if     L_linear == 256
    lsp = [ls02p,ls01p,ls0p,ls1p,ls2p,ls3p,ls4p];   % 256 ----> end
elseif L_linear == 512
    lsp = [ls02p,ls01p,ls0p,ls1p,ls2p,ls3p,ls4p,ls5p];   % 512 ----> end
elseif L_linear == 1024
    lsp = [ls02p,ls01p,ls0p,ls1p,ls2p,ls3p,ls4p,ls5p,ls6p];   % 1024   ----> end
elseif L_linear == 2048
    lsp = [ls02p,ls01p,ls0p,ls1p,ls2p,ls3p,ls4p,ls5p,ls6p,ls7p];   % 2048   ----> end
elseif L_linear == 4096
    lsp = [ls02p,ls01p,ls0p,ls1p,ls2p,ls3p,ls4p,ls5p,ls6p,ls7p,ls8p];   % 4096 ----> end
end


if     L_linear == 256
    % 256 ----> end
    for i = 2 : length(t)
        if i <= L02
            w_lf(1 + 1 : L02) = lfres02.p1 .* t(1 + 1 : L02) + lfres02.p2;
        elseif i > L02 && i <= L01
            w_lf(L02 + 1 : L01) = lfres01.p1 .* t(L02 + 1 : L01) + lfres01.p2;
        elseif i > L01 && i <= L0
            w_lf(L01 + 1 : L0) = lfres0.p1 .* t(L01 + 1 : L0) + lfres0.p2;
        elseif i > L0 && i <= L1
            w_lf(L0 + 1 : L1) = lfres1.p1 .* t(L0 + 1 : L1) + lfres1.p2;
        elseif i > L1 && i <= L2
            w_lf(L1 + 1 : L2) = lfres2.p1 .* t(L1 + 1 : L2) + lfres2.p2;
        elseif i > L2 && i <= L3
            w_lf(L2 + 1 : L3) = lfres3.p1 .* t(L2 + 1 : L3) + lfres3.p2;
        elseif i > L3
            w_lf(L3 + 1 : end) = lfres4.p1 .* t(L3 + 1 : end) + lfres4.p2;
        end
    end
elseif L_linear == 512
    % 512 ----> end
    for i = 2 : length(t)
        if i <= L02
            w_lf(1 + 1 : L02) = lfres02.p1 .* t(1 + 1 : L02) + lfres02.p2;
        elseif i > L02 && i <= L01
            w_lf(L02 + 1 : L01) = lfres01.p1 .* t(L02 + 1 : L01) + lfres01.p2;
        elseif i > L01 && i <= L0
            w_lf(L01 + 1 : L0) = lfres0.p1 .* t(L01 + 1 : L0) + lfres0.p2;
        elseif i > L0 && i <= L1
            w_lf(L0 + 1 : L1) = lfres1.p1 .* t(L0 + 1 : L1) + lfres1.p2;
        elseif i > L1 && i <= L2
            w_lf(L1 + 1 : L2) = lfres2.p1 .* t(L1 + 1 : L2) + lfres2.p2;
        elseif i > L2 && i <= L3
            w_lf(L2 + 1 : L3) = lfres3.p1 .* t(L2 + 1 : L3) + lfres3.p2;
        elseif i > L3 && i <= L4
            w_lf(L3 + 1 : L4) = lfres4.p1 .* t(L3 + 1 : L4) + lfres4.p2;
        elseif i > L4
            w_lf(L4 + 1 : end) = lfres5.p1 .* t(L4 + 1 : end) + lfres5.p2;
        end
    end
elseif L_linear == 1024
    % 1024   ----> end
    for i = 2 : length(t)
        if i <= L02
            w_lf(1 + 1 : L02) = lfres02.p1 .* t(1 + 1 : L02) + lfres02.p2;
        elseif i > L02 && i <= L01
            w_lf(L02 + 1 : L01) = lfres01.p1 .* t(L02 + 1 : L01) + lfres01.p2;
        elseif i > L01 && i <= L0
            w_lf(L01 + 1 : L0) = lfres0.p1 .* t(L01 + 1 : L0) + lfres0.p2;
        elseif i > L0 && i <= L1
            w_lf(L0 + 1 : L1) = lfres1.p1 .* t(L0 + 1 : L1) + lfres1.p2;
        elseif i > L1 && i <= L2
            w_lf(L1 + 1 : L2) = lfres2.p1 .* t(L1 + 1 : L2) + lfres2.p2;
        elseif i > L2 && i <= L3
            w_lf(L2 + 1 : L3) = lfres3.p1 .* t(L2 + 1 : L3) + lfres3.p2;
        elseif i > L3 && i <= L4
            w_lf(L3 + 1 : L4) = lfres4.p1 .* t(L3 + 1 : L4) + lfres4.p2;
        elseif i > L4 && i <= L5
            w_lf(L4 + 1 : L5) = lfres5.p1 .* t(L4 + 1 : L5) + lfres5.p2;
        elseif i > L5
            w_lf(L5 + 1 : end) = lfres6.p1 .* t(L5 + 1 : end) + lfres6.p2;
        end
    end
elseif L_linear == 2048
    % 2048   ----> end
    for i = 2 : length(t)
        if i <= L02
            w_lf(1 + 1 : L02) = lfres02.p1 .* t(1 + 1 : L02) + lfres02.p2;
        elseif i > L02 && i <= L01
            w_lf(L02 + 1 : L01) = lfres01.p1 .* t(L02 + 1 : L01) + lfres01.p2;
        elseif i > L01 && i <= L0
            w_lf(L01 + 1 : L0) = lfres0.p1 .* t(L01 + 1 : L0) + lfres0.p2;
        elseif i > L0 && i <= L1
            w_lf(L0 + 1 : L1) = lfres1.p1 .* t(L0 + 1 : L1) + lfres1.p2;
        elseif i > L1 && i <= L2
            w_lf(L1 + 1 : L2) = lfres2.p1 .* t(L1 + 1 : L2) + lfres2.p2;
        elseif i > L2 && i <= L3
            w_lf(L2 + 1 : L3) = lfres3.p1 .* t(L2 + 1 : L3) + lfres3.p2;
        elseif i > L3 && i <= L4
            w_lf(L3 + 1 : L4) = lfres4.p1 .* t(L3 + 1 : L4) + lfres4.p2;
        elseif i > L4 && i <= L5
            w_lf(L4 + 1 : L5) = lfres5.p1 .* t(L4 + 1 : L5) + lfres5.p2;
        elseif i > L5 && i <= L6
            w_lf(L5 + 1 : L6) = lfres6.p1 .* t(L5 + 1 : L6) + lfres6.p2;
        elseif i > L6
            if exist("Lend","var")
                w_lf(L6 + 1 : Lend) = lfres7.p1 .* t(L6 + 1 : Lend) + lfres7.p2;
            else
                w_lf(L6 + 1 : end) = lfres7.p1 .* t(L6 + 1 : end) + lfres7.p2;
            end
        end
    end
elseif L_linear == 4096
    % 4096 ----> end
    for i = 2 : length(t)
        if i <= L02
            w_lf(1 + 1 : L02) = lfres02.p1 .* t(1 + 1 : L02) + lfres02.p2;
        elseif i > L02 && i <= L01
            w_lf(L02 + 1 : L01) = lfres01.p1 .* t(L02 + 1 : L01) + lfres01.p2;
        elseif i > L01 && i <= L0
            w_lf(L01 + 1 : L0) = lfres0.p1 .* t(L01 + 1 : L0) + lfres0.p2;
        elseif i > L0 && i <= L1
            w_lf(L0 + 1 : L1) = lfres1.p1 .* t(L0 + 1 : L1) + lfres1.p2;
        elseif i > L1 && i <= L2
            w_lf(L1 + 1 : L2) = lfres2.p1 .* t(L1 + 1 : L2) + lfres2.p2;
        elseif i > L2 && i <= L3
            w_lf(L2 + 1 : L3) = lfres3.p1 .* t(L2 + 1 : L3) + lfres3.p2;
        elseif i > L3 && i <= L4
            w_lf(L3 + 1 : L4) = lfres4.p1 .* t(L3 + 1 : L4) + lfres4.p2;
        elseif i > L4 && i <= L5
            w_lf(L4 + 1 : L5) = lfres5.p1 .* t(L4 + 1 : L5) + lfres5.p2;
        elseif i > L5 && i <= L6
            w_lf(L5 + 1 : L6) = lfres6.p1 .* t(L5 + 1 : L6) + lfres6.p2;
        elseif i > L6 && i<= L7
            w_lf(L6 + 1 : L7) = lfres7.p1 .* t(L6 + 1 : L7) + lfres7.p2;
        elseif i > L7
            w_lf(L7 + 1 : end) = lfres8.p1 .* t(L7 + 1 : end) + lfres8.p2;
        end
    end
end
    %  w_lf (1:L02) = w(1:L02);
e_w_qf = abs(w - w_qf);
e_w_lf = abs(w - w_lf);
er_w_qf = e_w_qf ./ abs(w);
er_w_lf = e_w_lf ./ abs(w);
L1 = 32;
L2 = 128;
L3 = 512;
L4 = 2048;

figure('Name', 'w & wqf & wlf');
n = 1 : 1 : length(t);
subplot(1,3,1);
plot(n(L1 + 1 : L4),w(L1 + 1 : L4),'r','LineWidth',3);
hold on
plot(n(L1 + 1 : L4),w_qf(L1 + 1 : L4),'b','LineWidth',3);
hold on
plot(n(L1 + 1 : L4),w_lf(L1 + 1 : L4),'g','LineWidth',3);
hold on
% title('(a) L1 -- L2','fontname','Times New Roman','Color','b','FontSize',16);
xlabel('n','fontname','Times New Roman','FontSize',16);
ylabel('w','fontname','Times New Roman','FontSize',14);
set(gca,'FontName','Times New Roman','FontSize',16);
legend('w','wqf','wlf');

subplot(1,3,2);
plot(n(L1 + 1 : L4),e_w_qf(L1 + 1 : L4),'r','LineWidth',3);
hold on
plot(n(L1 + 1 : L4),e_w_lf(L1 + 1 : L4),'b','LineWidth',3);
hold on
% title('(b) L2 -- L3','fontname','Times New Roman','Color','b','FontSize',16);
xlabel('n','fontname','Times New Roman','FontSize',16);
ylabel('w','fontname','Times New Roman','FontSize',14);
set(gca,'FontName','Times New Roman','FontSize',16);
legend('ewqf','ewlf');

subplot(1,3,3);
plot(n(L1 + 1 : L4),er_w_qf(L1 + 1 : L4),'r','LineWidth',3);
hold on
plot(n(L1 + 1 : L4),er_w_lf(L1 + 1 : L4),'b','LineWidth',3);
hold on
% title('(b) L2 -- L3','fontname','Times New Roman','Color','b','FontSize',16);
xlabel('n','fontname','Times New Roman','FontSize',16);
ylabel('w','fontname','Times New Roman','FontSize',14);
set(gca,'FontName','Times New Roman','FontSize',16);
legend('erwqf','erwlf');

% 
% figure('Name', 'w & wqf & wlf');
% n = 1 : 1 : length(t);
% subplot(1,3,1);
% plot(n(L1 + 1 : L2),w(L1 + 1 : L2),'r','LineWidth',3);
% hold on
% plot(n(L1 + 1 : L2),w_qf(L1 + 1 : L2),'b','LineWidth',3);
% hold on
% plot(n(L1 + 1 : L2),w_lf(L1 + 1 : L2),'g','LineWidth',3);
% hold on
% title('(a) L1 -- L2','fontname','Times New Roman','Color','b','FontSize',16);
% xlabel('n','fontname','Times New Roman','FontSize',16);
% ylabel('w','fontname','Times New Roman','FontSize',14);
% set(gca,'FontName','Times New Roman','FontSize',16);
% legend('w','wqf','wlf');
% 
% subplot(1,3,2);
% plot(n(L2 + 1 : L3),w(L2 + 1 : L3),'r','LineWidth',3);
% hold on
% plot(n(L2 + 1 : L3),w_qf(L2 + 1 : L3),'b','LineWidth',3);
% hold on
% plot(n(L2 + 1 : L3),w_lf(L2 + 1 : L3),'g','LineWidth',3);
% hold on
% title('(b) L2 -- L3','fontname','Times New Roman','Color','b','FontSize',16);
% xlabel('n','fontname','Times New Roman','FontSize',16);
% ylabel('w','fontname','Times New Roman','FontSize',14);
% set(gca,'FontName','Times New Roman','FontSize',16);
% legend('w','wqf','wlf');
% 
% subplot(1,3,3);
% plot(n(L3 + 1 : L4),w(L3 + 1 : L4),'r','LineWidth',3);
% hold on
% plot(n(L3 + 1 : L4),w_qf(L3 + 1 : L4),'b','LineWidth',3);
% hold on
% plot(n(L3 + 1 : L4),w_lf(L3 + 1 : L4),'g','LineWidth',3);
% hold on
% title('(c) L3 -- L4','fontname','Times New Roman','Color','b','FontSize',16);
% xlabel('n','fontname','Times New Roman','FontSize',16);
% ylabel('w','fontname','Times New Roman','FontSize',14);
% set(gca,'FontName','Times New Roman','FontSize',16);
% legend('w','wqf','wlf');
% 
% figure('Name', 'ewqf & ewlf');
% subplot(1,3,1);
% plot(n(L1 + 1 : L2),e_w_qf(L1 + 1 : L2),'r','LineWidth',3);
% hold on
% plot(n(L1 + 1 : L2),e_w_lf(L1 + 1 : L2),'b','LineWidth',3);
% hold on
% title('(a) L1 -- L2','fontname','Times New Roman','Color','b','FontSize',16);
% xlabel('n','fontname','Times New Roman','FontSize',16);
% ylabel('w','fontname','Times New Roman','FontSize',16);
% set(gca,'FontName','Times New Roman','FontSize',16);
% legend('ewqf','ewlf');
% 
% subplot(1,3,2);
% plot(n(L2 + 1 : L3),e_w_qf(L2 + 1 : L3),'r','LineWidth',3);
% hold on
% plot(n(L2 + 1 : L3),e_w_lf(L2 + 1 : L3),'b','LineWidth',3);
% hold on
% title('(b) L2 -- L3','fontname','Times New Roman','Color','b','FontSize',16);
% xlabel('n','fontname','Times New Roman','FontSize',16);
% ylabel('w','fontname','Times New Roman','FontSize',16);
% set(gca,'FontName','Times New Roman','FontSize',16);
% legend('ewqf','ewlf');
% 
% subplot(1,3,3);
% plot(n(L3 + 1 : L4),e_w_qf(L3 + 1 : L4),'r','LineWidth',3);
% hold on
% plot(n(L3 + 1 : L4),e_w_lf(L3 + 1 : L4),'b','LineWidth',3);
% hold on
% title('(c) L3 -- L4','fontname','Times New Roman','Color','b','FontSize',16);
% xlabel('n','fontname','Times New Roman','FontSize',16);
% ylabel('w','fontname','Times New Roman','FontSize',16);
% set(gca,'FontName','Times New Roman','FontSize',16);
% legend('ewqf','ewlf');
% 
