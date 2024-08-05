clc
clear
h = 0.01;
Thn = 50;
tt = h : h : Thn;
t = Thn/h;
pi = 3.1415926;
r = 1;


%% test 1
u = sin(pi*tt);
alpha = 0.8;
%% simulation
[dx_o] = GLF_Original(u,t,alpha,h,1024);

[dx_pwqef] = GLF_PWQEF(u,t,alpha,h,1024);

dx_pwqef_hex = num2hex(single(dx_pwqef));
writematrix(dx_pwqef_hex,'dx_pwqef_hex.txt','Delimiter','tab');

figure('name','test1')
plot(tt,u,'r','LineWidth',2);
hold on
aplot = plot(tt, dx_o, 'b-o','MarkerIndices',1:150:length(dx_o), 'LineWidth',2);
% plot(tt,y,'--yp','LineWidth',2,... %设置线宽为2
%                 'MarkerSize',10,... %设置标记点的尺寸/大小为10号
%                 'MarkerFaceColor','y',... %设置标记点填充颜色为黄色
%                 'MarkerEdgeColor','k') %设置标记点边缘颜色为黑色
% aplot.Color(4) = 0.2;
hold on
plot(tt,dx_pwqef,'--k','LineWidth',2);
hold on
%title('(a) comparison','fontname','Times New Roman','Color','b','FontSize',16);
xlabel('Time(s)','fontname','Times New Roman','FontSize',18);
ylabel('Amplitude','fontname','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','FontSize',16);
legend('u','Theoretical','PWQEF');

%% test 2
u = sin(pi*tt);
alpha = -0.8;
%% simulation
[dx_o] = GLF_Original(u,t,alpha,h,1024);

[dx_pwqef] = GLF_PWQEF(u,t,alpha,h,1024);

dx_pwqef_hex = num2hex(single(dx_pwqef));
writematrix(dx_pwqef_hex,'dx_pwqef_hex.txt','Delimiter','tab');

figure('name','test2')
plot(tt,u,'r','LineWidth',2);
hold on
aplot = plot(tt, dx_o, 'b-o','MarkerIndices',1:150:length(dx_o), 'LineWidth',2);
% plot(tt,y,'--yp','LineWidth',2,... %设置线宽为2
%                 'MarkerSize',10,... %设置标记点的尺寸/大小为10号
%                 'MarkerFaceColor','y',... %设置标记点填充颜色为黄色
%                 'MarkerEdgeColor','k') %设置标记点边缘颜色为黑色
% aplot.Color(4) = 0.2;
hold on
plot(tt,dx_pwqef,'--k','LineWidth',2);
hold on
%title('(a) comparison','fontname','Times New Roman','Color','b','FontSize',16);
xlabel('Time(s)','fontname','Times New Roman','FontSize',18);
ylabel('Amplitude','fontname','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','FontSize',16);
legend('u','Theoretical','PWQEF');

%% test 3
u = square(tt);
alpha = -0.9;
%% simulation
[dx_o] = GLF_Original(u,t,alpha,h,1024);

[dx_pwqef] = GLF_PWQEF(u,t,alpha,h,1024);

dx_pwqef_hex = num2hex(single(dx_pwqef));
writematrix(dx_pwqef_hex,'dx_pwqef_hex.txt','Delimiter','tab');

figure('name','test3')
plot(tt,u,'r','LineWidth',2);
hold on
aplot = plot(tt, dx_o, 'b-o','MarkerIndices',1:150:length(dx_o), 'LineWidth',2);
% plot(tt,y,'--yp','LineWidth',2,... %设置线宽为2
%                 'MarkerSize',10,... %设置标记点的尺寸/大小为10号
%                 'MarkerFaceColor','y',... %设置标记点填充颜色为黄色
%                 'MarkerEdgeColor','k') %设置标记点边缘颜色为黑色
% aplot.Color(4) = 0.2;
hold on
plot(tt,dx_pwqef,'--k','LineWidth',2);
hold on
%title('(a) comparison','fontname','Times New Roman','Color','b','FontSize',16);
xlabel('Time(s)','fontname','Times New Roman','FontSize',18);
ylabel('Amplitude','fontname','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','FontSize',16);
legend('u','Theoretical','PWQEF');

%% test 4
u = square(tt);
alpha = -0.3;
%% simulation
[dx_o] = GLF_Original(u,t,alpha,h,1024);

[dx_pwqef] = GLF_PWQEF(u,t,alpha,h,1024);

dx_pwqef_hex = num2hex(single(dx_pwqef));
writematrix(dx_pwqef_hex,'dx_pwqef_hex.txt','Delimiter','tab');

figure('name','test4')
plot(tt,u,'r','LineWidth',2);
hold on
aplot = plot(tt, dx_o, 'b-o','MarkerIndices',1:150:length(dx_o), 'LineWidth',2);
% plot(tt,y,'--yp','LineWidth',2,... %设置线宽为2
%                 'MarkerSize',10,... %设置标记点的尺寸/大小为10号
%                 'MarkerFaceColor','y',... %设置标记点填充颜色为黄色
%                 'MarkerEdgeColor','k') %设置标记点边缘颜色为黑色
% aplot.Color(4) = 0.2;
hold on
plot(tt,dx_pwqef,'--k','LineWidth',2);
hold on
%title('(a) comparison','fontname','Times New Roman','Color','b','FontSize',16);
xlabel('Time(s)','fontname','Times New Roman','FontSize',18);
ylabel('Amplitude','fontname','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','FontSize',16);
legend('u','Theoretical','PWQEF');

%% test 5
u = sawtooth(tt);
alpha = -0.9;
%% simulation
[dx_o] = GLF_Original(u,t,alpha,h,1024);

[dx_pwqef] = GLF_PWQEF(u,t,alpha,h,1024);

dx_pwqef_hex = num2hex(single(dx_pwqef));
writematrix(dx_pwqef_hex,'dx_pwqef_hex.txt','Delimiter','tab');

figure('name','test5')
plot(tt,u,'r','LineWidth',2);
hold on
aplot = plot(tt, dx_o, 'b-o','MarkerIndices',1:150:length(dx_o), 'LineWidth',2);
% plot(tt,y,'--yp','LineWidth',2,... %设置线宽为2
%                 'MarkerSize',10,... %设置标记点的尺寸/大小为10号
%                 'MarkerFaceColor','y',... %设置标记点填充颜色为黄色
%                 'MarkerEdgeColor','k') %设置标记点边缘颜色为黑色
% aplot.Color(4) = 0.2;
hold on
plot(tt,dx_pwqef,'--k','LineWidth',2);
hold on
%title('(a) comparison','fontname','Times New Roman','Color','b','FontSize',16);
xlabel('Time(s)','fontname','Times New Roman','FontSize',18);
ylabel('Amplitude','fontname','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','FontSize',16);
legend('u','Theoretical','PWQEF');

%% test 6
u = sawtooth(tt);
alpha = -0.2;
%% simulation
[dx_o] = GLF_Original(u,t,alpha,h,1024);

[dx_pwqef] = GLF_PWQEF(u,t,alpha,h,1024);

dx_pwqef_hex = num2hex(single(dx_pwqef));
writematrix(dx_pwqef_hex,'dx_pwqef_hex.txt','Delimiter','tab');

figure('name','test6')
plot(tt,u,'r','LineWidth',2);
hold on
aplot = plot(tt, dx_o, 'b-o','MarkerIndices',1:150:length(dx_o), 'LineWidth',2);
% plot(tt,y,'--yp','LineWidth',2,... %设置线宽为2
%                 'MarkerSize',10,... %设置标记点的尺寸/大小为10号
%                 'MarkerFaceColor','y',... %设置标记点填充颜色为黄色
%                 'MarkerEdgeColor','k') %设置标记点边缘颜色为黑色
% aplot.Color(4) = 0.2;
hold on
plot(tt,dx_pwqef,'--k','LineWidth',2);
hold on
%title('(a) comparison','fontname','Times New Roman','Color','b','FontSize',16);
xlabel('Time(s)','fontname','Times New Roman','FontSize',18);
ylabel('Amplitude','fontname','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','FontSize',16);
legend('u','Theoretical','PWQEF');

% %% Gen quadratic coefficients
% [c_sx] = gen_pwqef_parameters(t,alpha,h,r,1024);
% c_sx_hex = num2hex(single(c_sx))
% writematrix(c_sx_hex,'pwqef_hex.txt','Delimiter','tab');
% alpha_hex = num2hex(single(alpha))
% h_q_hex = num2hex(single(1/(h^alpha)))
% u_hex = num2hex(single(u));
% writematrix(u_hex,'u_rom.txt','Delimiter','tab');


