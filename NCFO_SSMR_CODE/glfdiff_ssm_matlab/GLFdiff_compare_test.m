clc
clear
h = 0.01;
Thn = 50;
tt = h : h : Thn;
t = Thn/h;
pi = 3.1415926;
r = 1;
test1 = 1;
if exist("test1","var")
    %% test1
    u = sin(pi*tt);
    alpha = 0.8;    
elseif exist("test2","var")
    %% test2
    u = sin(pi*tt);
    alpha = -0.8;
elseif exist("test3","var")
    %% test 3
    u = square(tt);
    alpha = -0.9;
elseif exist("test4","var")
    %% test 4
    u = square(tt);
    alpha = -0.7;
elseif exist("test5","var")
    %% test 5
    u = square(tt);
    alpha = -0.5;
elseif exist("test6","var")
    %% test 6
    u = square(tt);
    alpha = -0.3;
elseif exist("test7","var")
    %% test 7
    u = sawtooth(tt);
    alpha = -0.9;    
elseif exist("test8","var")
    %% test 8
    u = sawtooth(tt);
    alpha = -0.7;
elseif exist("test9","var")
    %% test 9
    u = sawtooth(tt);
    alpha = -0.5;
elseif exist("test10","var")
    %% test 10
    u = sawtooth(tt);
    alpha = -0.2;
elseif exist("test11","var")
    %% test 11
    u = ones(1,length(tt),'single');
    alpha = 0.8;
end
%% Gen quadratic coefficients
[c_sx] = gen_pwqef_parameters(t,alpha,h,r,1024);
c_sx_hex = num2hex(single(c_sx))
writematrix(c_sx_hex,'pwqef_hex.txt','Delimiter','tab');
alpha_hex = num2hex(single(alpha))
h_q_hex = num2hex(single(1/(h^alpha)))
u_hex = num2hex(single(u));
writematrix(u_hex,'u_rom.txt','Delimiter','tab');
%% simulation
[dx_o] = GLF_Original(u,t,alpha,h,1024);
[dx_256_l] = GLF_L(u,t,alpha,h,256);
[dx_512_l] = GLF_L(u,t,alpha,h,512);
[dx_1024_l] = GLF_L(u,t,alpha,h,1024);
[dx_linear] = GLF_Linear(u,t,alpha,h,128);
[dx_quadratic] = GLF_Quadratic(u,t,alpha,h,128);
[dx_pwl] = GLF_PWL(u,t,alpha,h,1024);
[dx_pwqef] = GLF_PWQEF(u,t,alpha,h,1024);

dx_pwqef_hex = num2hex(single(dx_pwqef));
writematrix(dx_pwqef_hex,'dx_pwqef_hex.txt','Delimiter','tab');

figure('name','test')

subplot(1,2,1);
aplot = plot(tt, dx_o, 'b-o','MarkerIndices',1:150:length(dx_o), 'LineWidth',2);
% plot(tt,y,'--yp','LineWidth',2,... %设置线宽为2  
%                 'MarkerSize',10,... %设置标记点的尺寸/大小为10号
%                 'MarkerFaceColor','y',... %设置标记点填充颜色为黄色
%                 'MarkerEdgeColor','k') %设置标记点边缘颜色为黑色
% aplot.Color(4) = 0.2;
hold on 
% plot(tt,dx_256_l,'r--x','MarkerIndices',1:100:length(y_L_1024),'LineWidth',2);
% hold on 
% plot(tt,dx_512_l,'--k','LineWidth',2);
% hold on 
plot(tt,dx_1024_l,'-.c','LineWidth',2);
hold on
plot(tt,dx_linear,':m','LineWidth',2);
hold on 
plot(tt,dx_quadratic,'g','LineWidth',2);
hold on 
plot(tt,dx_pwl,'r--x','LineWidth',2);
hold on 
plot(tt,dx_pwqef,'--k','LineWidth',2);
hold on 
%title('(a) comparison','fontname','Times New Roman','Color','b','FontSize',16);
xlabel('Time(s)','fontname','Times New Roman','FontSize',18);
ylabel('Amplitude','fontname','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','FontSize',16);
legend('Theoretical','L=1024','L_Linear','L_Quadratic','PWL','PWQEF');


e_dx_1024_l = abs(dx_o - dx_1024_l);
e_dx_linear = abs(dx_o - dx_linear);
e_dx_quadratic = abs(dx_o - dx_quadratic);
e_dx_pwl = abs(dx_o - dx_pwl);
e_dx_pwqef = abs(dx_o - dx_pwqef);
    
e_l_1024_max = max(e_dx_1024_l)
e_L_Linear_max = max(e_dx_linear)
e_L_Quadratic_max = max(e_dx_quadratic)
e_PWL_max = max(e_dx_pwl)
e_PWQEF_max = max(e_dx_pwqef)

subplot(1,2,2);
plot(tt,e_dx_1024_l,'r--x','MarkerIndices',1:100:length(e_dx_1024_l),'LineWidth',2);
hold on 
plot(tt,e_dx_linear,'--b','LineWidth',2);
hold on
plot(tt,e_dx_quadratic,'-.c','LineWidth',2);
hold on
plot(tt,e_dx_pwl,':m','LineWidth',2);
hold on 
plot(tt,e_dx_pwqef,'g','LineWidth',2);
hold on 

%title('(b) error','fontname','Times New Roman','Color','b','FontSize',16);
xlabel('Time(s)','fontname','Times New Roman','FontSize',18);
ylabel('Absolute error','fontname','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','FontSize',16);
legend('L=1024','L_Linear','L_Quadratic','PWL','PWQEF');





