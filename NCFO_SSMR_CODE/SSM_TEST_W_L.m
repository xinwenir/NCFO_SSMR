clc
clear
h = 0.01;
Thn = 100;
tt = h : h : Thn;
t = Thn/h;
%% test1
% u = [1, ones(1,t-1,'single')];
% A = [0, 0,     0, 0, 1, 0, 0, 0;
%      0, 0,  -2.5, 0, 0, 1, 0, 1;
%      1, 0,  -3.1, 1, 0, 0, 0, 0;
%      0, 1, -2.89, 0, 0, 0, 0, 0;
%      0, 0,     0, 0, 0, 0, 0, 0;
%      0, 0,     0, 0, 0, 0, 1, 0;
%      0, 0,  -1.2, 0, 0, 0, 0, 0;
%      0, 0,     0, 0, 0, 0, 0, 0];
% A_str = num2hex(single(A))
% B = [0; 0; 0; 0; 0; 0; 2; 5];
% B_str = num2hex(single(B))
% C = [0,  0,  1,  0,  0,  0,  0,  0];
% C_str = num2hex(single(C))
% D = 0;
% x0 = [0; 0;  0;  0;  0;  0;  0;  0];
% r = [2, 5, 1];
% alpha = [0.5, 0.7, 0.8];
% alpha_str = num2hex(single(alpha))
%% Test1 - R
u = [1, ones(1,t-1,'single')];
A = [0,     -5/2, 0, 1, 0, 1;
     0,   -31/10, 1, 0, 0, 0;
     1, -289/100, 0, 0, 0, 0;
     0,        0, 0, 0, 1, 0;
     0,     -6/5, 0, 0, 0, 0;
     0,        0, 0, 0, 0, 0];
A_str = num2hex(single(A))
B =[0; 0; 0; 0; 2; 5];
B_str = num2hex(single(B))  
C = [0, 1, 0, 0, 0, 0];
C_str = num2hex(single(C)) 
D = 0;
x0 = [0; 0;  0;  0;  0;  0]; 
r = [1, 4, 1];
alpha = [0.5, 0.7, 0.8];
alpha_str = num2hex(single(alpha))
%% test E2 - o
% u = [0, ones(1,t-1,'double');
%      0, ones(1,t-1,'double')];
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
% D = [0,0;
%      0,0];
% x0 = [0; 0; 0; 0; 0; 0];
% alpha = [1.1, 1.1, 1.1, 1.1, 1.2, 1.3];
% r = [4,1,1];  
% mL = 2;


%% TEST E3


[x,y] = fossm(u,t,A,B,C,D,x0,alpha,h,r);
% [x_PWQEF,y_PWQEF] = fossm_PWQEF(u,t,A,B,C,D,x0,alpha,h,r,2048);
% [x_PWL,y_PWL] = fossm_PWL(u,t,A,B,C,D,x0,alpha,h,r,2048);
[x_L_32,y_L_32] = fossm_PWL(u,t,A,B,C,D,x0,alpha,h,r,2048);
[x_L_64,y_L_64] = fossm_PWQEF(u,t,A,B,C,D,x0,alpha,h,r,2048);
[x_L_128,y_L_128] = fossm_l_linear(u,t,A,B,C,D,x0,alpha,h,r,1024);
[x_L_256,y_L_256] = fossm_l_quadratic(u,t,A,B,C,D,x0,alpha,h,r,1024);
[x_L_512,y_L_512] = fossm_l(u,t,A,B,C,D,x0,alpha,h,r,512);
[x_L_1024,y_L_1024] = fossm_l(u,t,A,B,C,D,x0,alpha,h,r,1024);

% [x2,y2] = fossm_l_linear(u,t,A,B,C,D,x0,alpha,h,r,64);
% [x4,y4] = fossm_l_linear(u,t,A,B,C,D,x0,alpha,h,r,512);
% [x6,y6] = fossm_l_linear(u,t,A,B,C,D,x0,alpha,h,r,1024);
figure('name','test')

subplot(1,2,1);
aplot = plot(tt, y, '--b', 'LineWidth',3);
% aplot = plot(tt,y,'--yp','LineWidth',2,... %设置线宽为2  
%                 'MarkerSize',10,... %设置标记点的尺寸/大小为10号
%                 "MarkerIndices",1:500:length(y),...%设置标记点的间距
%                 'MarkerFaceColor','y',... %设置标记点填充颜色为黄色
%                 'MarkerEdgeColor','k') %设置标记点边缘颜色为黑色
aplot.Color(4) = 0.8;
hold on 
bplot = plot(tt,y_L_32,'m','LineWidth',3);

bplot.Color(4) = 0.8;
hold on 
cplot = plot(tt,y_L_64,'y','LineWidth',3);
cplot.Color(4) = 1;
hold on 
dplot = plot(tt,y_L_128,'c','LineWidth',3);
dplot.Color(4) = 0.8;
hold on 
% eplot = plot(tt,y_L_256,'g','LineWidth',3);
eplot = plot(tt,y_L_256,'g-*','LineWidth',2,... %设置线宽为2  
                'MarkerSize',8,... %设置标记点的尺寸/大小为10号
                "MarkerIndices",1:500:length(y),...%设置标记点的间距
                'MarkerEdgeColor','k'); %设置标记点边缘颜色为黑色
eplot.Color(4) = 0.8;
hold on 
% fplot = plot(tt,y_L_512,'k','LineWidth',3);
fplot = plot(tt,y_L_512,'k--o','LineWidth',2,... %设置线宽为2  
                'MarkerSize',8,... %设置标记点的尺寸/大小为10号
                "MarkerIndices",1:500:length(y),...%设置标记点的间距
                'MarkerEdgeColor','k'); %设置标记点边缘颜色为黑色
fplot.Color(4) = 0.8;
hold on 
% gplot = plot(tt,y_L_1024,'r','LineWidth',3);
gplot = plot(tt,y_L_1024,'r-^','LineWidth',2,... %设置线宽为2  
                'MarkerSize',8,... %设置标记点的尺寸/大小为10号
                "MarkerIndices",1:500:length(y),...%设置标记点的间距
                'MarkerEdgeColor','k'); %设置标记点边缘颜色为黑色
gplot.Color(4) = 0.8;
hold on 

%title('(a) comparison','fontname','Times New Roman','Color','b','FontSize',16);
xlabel('Time(s)','fontname','Times New Roman','FontSize',18);
ylabel('Amplitude','fontname','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','FontSize',16);
legend('Theoretical','L=32','L=64','L=128','L=256','L=512','L=1024');

e_L_1024 = abs(y - y_L_1024);
e_L_512 = abs(y - y_L_512);
e_L_256 = abs(y - y_L_256);
e_L_128 = abs(y - y_L_128);
e_L_64 = abs(y - y_L_64);
e_L_32 = abs(y - y_L_32);

e_l_1024_max = max(e_L_1024)
e_l_512_max = max(e_L_512)
e_l_256_max = max(e_L_256)
e_l_128_max = max(e_L_128)
e_l_64_max = max(e_L_64)
e_l_32_max = max(e_L_32)

subplot(1,2,2);
plot(tt,e_L_32,'m','LineWidth',3);
hold on 
plot(tt,e_L_64,'y','LineWidth',3);
hold on 
plot(tt,e_L_128,'c','LineWidth',3);
hold on 
% plot(tt,e_L_256,'g','LineWidth',3);
plot(tt,e_L_256,'g-*','LineWidth',2,... %设置线宽为2  
                'MarkerSize',8,... %设置标记点的尺寸/大小为10号
                "MarkerIndices",1:500:length(y),...%设置标记点的间距
                'MarkerEdgeColor','k'); %设置标记点边缘颜色为黑色
hold on 
% plot(tt,e_L_512,'k','LineWidth',3);
plot(tt,e_L_512,'k--o','LineWidth',2,... %设置线宽为2  
                'MarkerSize',8,... %设置标记点的尺寸/大小为10号
                "MarkerIndices",1:500:length(y),...%设置标记点的间距
                'MarkerEdgeColor','k'); %设置标记点边缘颜色为黑色
hold on 
% plot(tt,e_L_1024,'r','LineWidth',3);
plot(tt,e_L_1024,'r-^','LineWidth',2,... %设置线宽为2  
                'MarkerSize',8,... %设置标记点的尺寸/大小为10号
                "MarkerIndices",1:500:length(y),...%设置标记点的间距
                'MarkerEdgeColor','k'); %设置标记点边缘颜色为黑色
hold on 

%title('(b) error','fontname','Times New Roman','Color','b','FontSize',16);
xlabel('Time(s)','fontname','Times New Roman','FontSize',18);
ylabel('Absolute error','fontname','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','FontSize',16);
legend('L=32','L=64','L=128','L=256','L=512','L=1024');

    




