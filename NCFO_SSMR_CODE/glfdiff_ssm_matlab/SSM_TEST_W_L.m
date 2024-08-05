% clc
% clear
% t = 0 : 1 : 10;
% u = [0, ones(1,100,'double')];a
% A = [-4, 1, 0, 0, 0, -4; 
%       0, 0, 0, 0, 0,  0;
%      -5, 0, 0, 0, 0, -5;
%      -6, 0, 0, 0, 0, -6;
%       0, 0, 0, 1, 0,  0;
%       0, 0, 1, 0, 1,  0];
% B = [0; 2; 0; 0; 3; 0];
% C = [1, 0, 0, 0, 0, 1];
% D = [0];
% x0 = [0; 0; 0; 0; 0; 0];
% alpha = [-0.5, -0.5, -0.5, -0.5, -0.6, -0.8];
% y = fossm(u,t,A,B,C,D,x0,alpha);
% plot(t,y);
 
% clc
% clear
% t = 0 : 1 : 100;
% u = [0, ones(1,100,'double')];
% A = [-1.2,  0, -2.2; 
%         1,  0,    0;
%         0,  1,    0];
% B = [1; 0; 0];
% C = [-1.2, 0, -2.2];
% D = [1];
% x0 = [0; 0; 0];
% alpha = [-0.9, -0.9, -0.4];
% y = fossm(u,t,A,B,C,D,x0,alpha);
% plot(t,y);


clc
clear
h = 0.01;
Thn = 100;
tt = h : h : Thn;
t = Thn/h;
%% test1
u = [1, ones(1,t-1,'single')];
A= [-1.2/2.2,   1;
      -1/2.2,   0];
A_str = num2hex(single(A))
B =  [0; 1/2.2];
B_str = num2hex(single(B))
C =  [1, 0];
C_str = num2hex(single(C))
D = 0;
x0 = [0; 0];
alpha = [1.3, 0.9];
alpha_str = num2hex(single(alpha))
r = [1,1];
%% test2
% u = [1, ones(1,t-1,'double')];
% A= [-2.2, -2.2, 0, -2.2;
%     -2.9, -2.9, 1, -2.9;
%       -1,   -1, 0,   -1;
%    -3.32,-3.32, 0,-3.32]; 
% B =  [0; 0; 1; 0];
% 
% C =  [1, 1, 0, 1];
% 
% D = 0;
% x0 = [0; 0; 0; 0];
% alpha = [1.1, 1.3, 1.7];
% r = [1,2,1];
% mL = 1;
%% test 3
% u = [1, ones(1,t-1,'double')];
% A= [
% 	   0,   0,   1;
%   -1/2.2,   0,   0;
% -1.2/2.2,   1,   0];
% 
% B =  [0; 1/2.2; 0];
% 
% C =  [1, 0, 0];
% D = 0;
% x0 = [0; 0; 0];
% alpha = [0.9, 0.4];
% r = [2,1];
% mL = 1;
%% test 4
% u = [1, ones(1,t-1,'double')];
% A= [
% 	  0,   1;
%   -1.25, -0.625];
% 
% B =  [0; 1.25];
% 
% C =  [1, 0];
% D = 0;
% x0 = [0; 0];
% alpha = [0.9, 1.3];
% r = [1,1];
% mL = 1;
%% test5-e1
% u = [1, ones(1,t-1,'double')];
% n1 = 52/155;
% n2 = 177/248;
% d1 = 5/124;
% d2 = 129/310;
% d3 = 2/31;
% d4 = 177/248;
% 
% A = [0, 1, -d2/d3, -d2/d3;
%      0, 0, -1/d3 , -1/d3 ;
%      1, 0, -d1/d3, -d1/d3;
%      0, 0, -d4/d3, -d4/d3];
% B = [n1/d3; 1/d3; 0; n2/d3];
% C = [0, 0, 1, 1];
% D = 0;
% x0 = [0; 0; 0; 0];
% alpha = [0.9, 0.98, 1.3, 1.05];
% r = [1,1,1,1];
% mL = 1;
%% TEST-E1-Q
% u = sin(tt);
% n1 = 1257/1500;
% n2 = 1;
% d1 = 16/15;
% d2 = 1257/1500;
% d3 = 4/75;
% d4 = 1/30;
% 
% A = [0, 1, -d1/d3, -d1/d3;
%      0, 0, -1/d3 , -1/d3 ;
%      1, 0, -d2/d3, -d2/d3;
%      0, 0, -d4/d3, -d4/d3];
% B = [n2/d3; 1/d3; n1/d3; 0];
% C = [0, 0, 1, 1];
% D = 0;
% x0 = [0; 0; 0; 0];
% alpha = [1, 1.2, 1.3];
% r = [2,1,1];
% mL = 1;
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
%% TEST E2 - I
% u = [0, ones(1,t-1,'double');
%      0, ones(1,t-1,'double')];
% u = [0, ones(1,t-1,'double');
%      zeros(1,t,'double')]; 
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
% D = [0,0;
%      0,0];
% x0 = [0; 0; 0; 0; 0; 0];
% alpha = [1.1, 1.1, 1.1, 1.1, 1.2, 1.3];
% r = [4,1,1];  
% mL = 2;

%% TEST E3
% u = [0, ones(1,t-1,'double')];
% n1 = 2777777.78; 
% n2 = 7500.0;
% d1 = 787037037.04;
% d2 = 1312.5;
% d3 = 740740.74;
% d4 = 3600.0;
% d5 = 2225000.0;
% d6 = 462962.96;
% 
% A= [-d2, 0, 0, -d2, 1, 0;
%     -d5, 0, 0, -d5, 0, 0;
%     -d1, 0, 0, -d1, 0, 0;
%     -d4, 1, 0, -d4, 0, 1;
%     -d6, 0, 0, -d6, 0, 0;    
%     -d3, 0, 1, -d3, 0, 0]; 
% B =  [0; n2; n1; 0; 0; 0];
% C =  [1, 0, 0, 1, 0, 0];
% D = 0;
% x0 = [0; 0; 0; 0; 0; 0];
% alpha = [0.96, 0.97, 1.37];
% r = [3,1,2];
% mL = 1;

[x,y] = fossm(u,t,A,B,C,D,x0,alpha,h,r);
% [x_PWQEF,y_PWQEF] = fossm_PWQEF(u,t,A,B,C,D,x0,alpha,h,r,2048);
% [x_PWL,y_PWL] = fossm_PWL(u,t,A,B,C,D,x0,alpha,h,r,2048);
[x_L_32,y_L_32] = fossm_l(u,t,A,B,C,D,x0,alpha,h,r,32);
[x_L_64,y_L_64] = fossm_l(u,t,A,B,C,D,x0,alpha,h,r,64);
[x_L_128,y_L_128] = fossm_l(u,t,A,B,C,D,x0,alpha,h,r,128);
[x_L_256,y_L_256] = fossm_l(u,t,A,B,C,D,x0,alpha,h,r,256);
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

    




