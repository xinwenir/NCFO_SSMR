clc
clear
h = 0.01;
Thn = 50;
tt = h : h : Thn;
t = Thn/h;

%% test1
% u = [1, ones(1,t-1,'double')];
% A= [-1.2/2.2,   1;
%       -1/2.2,   0];
% B =  [0; 1/2.2];
% C =  [1, 0];
% D = 0;
% x0 = [0; 0];
% alpha = [1.3, 0.9];
% r = [1,1];
% mL = 1;
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
% u = [ones(1,round(t/3)), sin(tt(round(t/3)+ 1 : end))];
% n1 = -81/18062500000000; %*s^(33/10)
% n2 = -3/903125;          %*s^(24/25)
% n3 = -1701/289000000000; %*s^(117/50)
% n4 = -3/1445000;         %*s^(97/100)
% n5 = -81/180625000;      %*s^(137/100)
% n6 = -729/45156250000;   %*s^(233/100)
%  
% % hd = (27*s^(33/10))/21250000000 + (2*s^(24/25))/2125 + (567*s^(117/50))/340000000 + s^(97/100)/1700 + (2403*s^(137/100))/850000 + (243*s^(233/100))/53125000 + 1
% d1 = 27/21250000000;    %*s^(33/10)
% d2 = 2/2125;            %*s^(24/25)
% d3 = 567/340000000;     %*s^(117/50)
% d4 = 1/1700;            %s^(97/100)
% d5 = 2403/850000;       %*s^(137/100)
% d6 = 243/53125000;      %*s^(233/100)
% 
% A= [-d2, 0, 0, -d2, 0, -d2;
%     -d6, 0, 0, -d6, 0, -d6;
%     -d1, 0, 0, -d1, 0, -d1;
%     -d4, 0, 0, -d4, 0, -d4;
%     -d3, 0, 1, -d3, 0, -d3;
%     -d5, 1, 0, -d5, 1, -d5];
% B =  [n2; n6; n1; n4; n3; n5];
% C =  [1, 0, 0, 1, 0, 1];
% D = 3/850;
% x0 = [0; 0; 0; 0; 0; 0];
% x0 = [-6.7972112e-05;
% -3.3033979e-07;
% -9.1761328e-11;
% -4.4381097e-05;
% -1.2692178e-07;
% -6.5840963e-05];
% alpha = [0.96, 0.97, 1.37];
% r = [3,2,1];
% mL = 1;
%% Reduce FPGA test1 Original
% u = [1, ones(1,t-1,'single')];
% A = [0, 0,     0, 0, 1, 0, 0, 0;
%      0, 0,  -2.5, 0, 0, 1, 0, 1;
%      1, 0,  -3.1, 1, 0, 0, 0, 0;
%      0, 1, -2.89, 0, 0, 0, 0, 0;
%      0, 0,     0, 0, 0, 0, 0, 0;
%      0, 0,     0, 0, 0, 0, 1, 0;
%      0, 0,  -1.2, 0, 0, 0, 0, 0;
%      0, 0,     0, 0, 0, 0, 0, 0];
% B = [0; 0; 0; 0; 0; 0; 2; 5];
% C = [0,  0,  1,  0,  0,  0,  0,  0];
% D = 0;
% x0 = [0; 0;  0;  0;  0;  0;  0;  0];
% alpha = [0.5, 0.7, 0.8];
% r = [2, 5, 1];
% mL = 1;
%% Reduce FPGA test1 Reduced
u = [1, ones(1,t-1,'single')];
A = [0,     -5/2, 0, 1, 0, 1;
     0,   -31/10, 1, 0, 0, 0;
     1, -289/100, 0, 0, 0, 0;
     0,        0, 0, 0, 1, 0;
     0,     -6/5, 0, 0, 0, 0;
     0,        0, 0, 0, 0, 0];
B = [0;  0;  0;  0;  2;  5]; 
C = [0, 1, 0, 0, 0, 0];
D = 0;
alpha = [0.5, 0.7, 0.8];
x0 = [0; 0;  0;  0;  0;  0];
r = [1, 4, 1];
mL = 1;
%% Reduce FPGA test2 Original
% u = [1, ones(1,t-1,'single')];
% u = 100 .* sin(tt.^2);
% A = [  -8,	0,	1,	0,	0, -8,	0,	0,	0;	
%    	    0,	0,	0,	0,	0,	0,	1,	0,	0;
%         0,	0,	0,	1,	0,  0,	0,	1,	0;
% 	    0,	0,	0,	0,	0,	0,	0,	0,	0;
%       -90,	0,	0,	0,	0,-90,	0,	0,	0;
%       -26,	1,	0,	0,	0,-26,	0,	0,	0;
%         0,	0,	0,	0,	0,  0,	0,	0,	0;
%       -73,	0,	0,	0,	1,-73,	0,	0,	1;
% 	    0,	0,	0,	0,	0,	0,	0,	0,	0];
% B = [0;	0;	0;	0;	0;	0;	0;	0;	1];
% C = [1,	0,	0,	0,	0,	1,	0,	0,	0];
% D = 0;
% alpha = [0.4, 0.7, 1.2];
% x0 = [0; 0;  0;  0;  0;  0;  0;  0;  0];
% r = [2,	3,	4];
% mL = 1;
%% Reduce FPGA test2 Reduced
% u = [1, ones(1,t-1,'single')];
% u = 100 .* sin(tt.^2);
% A = [ -8, 1, 0,  -8, 0, 0;
%        0, 0, 0,   0, 1, 0;
%      -90, 0, 0, -90, 0, 0;
%      -26, 0, 0, -26, 0, 0;
%      -73, 0, 1, -73, 0, 1;
%        0, 0, 0,   0, 0, 0]; 
% B = [0; 0; 0; 0; 0; 1];
% C = [1, 0, 0, 1, 0, 0];
% D = 0;
% x0 = [0; 0; 0;  0;  0;  0];
% alpha = [0.4, 0.7, 1.2];
% r = [1, 2, 3];  
% mL = 1;
%% Gen A,B,C,D,h_q,alpha
A_str = num2hex(single(A))
B_str = num2hex(single(B))
C_str = num2hex(single(C))
D_str = num2hex(single(D))
x0_str = num2hex(single(x0))
alpha_str = num2hex(single(alpha))
u_str = num2hex(single(u));
writematrix(u_str,'u_rom.txt','Delimiter','tab');
%% Gen quadratic coefficients
% [c_sx] = gen_pwqef_parameters(t,alpha,h,r,1024);
[c_sx] = gen_xxx_parameters(t,alpha,h,r,1024,'linear');
c_sx_str = num2hex(single(c_sx));
writematrix(c_sx_str,'c_sxstr.txt','Delimiter','tab');
%% simulation
[x,y] = fossm(u,t,A,B,C,D,x0,alpha,h,r);
% [x_PWQEF,y_PWQEF] = fossm_PWQEF(u,t,A,B,C,D,x0,alpha,h,r,2048);
[x_PWQEF,y_PWQEF] = fossm_PWL(u,t,A,B,C,D,x0,alpha,h,r,1024);
%% Gen y_PWQEF coefficients
y_PWQEF_str = num2hex(single(y_PWQEF));
writematrix(y_PWQEF_str,'y_PWQEF_str.txt','Delimiter','tab');

figure('name','test')
if mL > 1
    for i_pic = 1 : mL
        subplot(mL,2,2 * (i_pic - 1) + 1);
        plot(tt, y(i_pic,:), '--k', 'LineWidth',2);
        % plot(tt,y,'--yp','LineWidth',2,... %设置线宽为2  
        %                 'MarkerSize',10,... %设置标记点的尺寸/大小为10号
        %                 'MarkerFaceColor','y',... %设置标记点填充颜色为黄色
        %                 'MarkerEdgeColor','k') %设置标记点边缘颜色为黑色
        hold on 
        plot(tt,y_PWQEF(i_pic,:),'g','LineWidth',2);
        hold on 
        
        %title('(a) comparison','fontname','Times New Roman','Color','b','FontSize',16);
        xlabel('Time(s)','fontname','Times New Roman','FontSize',16);
        ylabel('Amplitude','fontname','Times New Roman','FontSize',16);
        set(gca,'FontName','Times New Roman','FontSize',16);
        legend('Theoretical','W-PWQEF');
%         legend('Theoretical','PWL','W-PWQEF');

        e_PWQEF = abs(y - y_PWQEF);
        
        e_PWQEF_max = max(e_PWQEF(i_pic,:))
        
        subplot(mL, 2, 2 * (i_pic - 1) + 2);
        
        plot(tt,e_PWQEF(i_pic,:),'g','LineWidth',2);
        hold on 

        %title('(b) error','fontname','Times New Roman','Color','b','FontSize',16);
        xlabel('Time(s)','fontname','Times New Roman','FontSize',16);
        ylabel('Absolute error','fontname','Times New Roman','FontSize',16);
        set(gca,'FontName','Times New Roman','FontSize',16);
%         legend('L=1024','L_Linear','L_Quadratic','PWL','PWQEF');
        legend('PWL','PWQEF');
    end
else
    subplot(1,2,1);
    aplot = plot(tt, y, 'b-o','MarkerIndices',1:150:length(y), 'LineWidth',2);
    % plot(tt,y,'--yp','LineWidth',2,... %设置线宽为2  
    %                 'MarkerSize',10,... %设置标记点的尺寸/大小为10号
    %                 'MarkerFaceColor','y',... %设置标记点填充颜色为黄色
    %                 'MarkerEdgeColor','k') %设置标记点边缘颜色为黑色
    % aplot.Color(4) = 0.2;
    hold on 
    dplot = plot(tt,y_PWQEF,'g','LineWidth',2);
    % dplot.Color(4) = 0.2;
    hold on 

    %title('(a) comparison','fontname','Times New Roman','Color','b','FontSize',16);
    xlabel('Time(s)','fontname','Times New Roman','FontSize',18);
    ylabel('Amplitude','fontname','Times New Roman','FontSize',16);
    set(gca,'FontName','Times New Roman','FontSize',16);
    legend('Theoretical','PWQEF');
%     legend('n','PWL','PWQEF');
    
    e_PWQEF = abs(y - y_PWQEF);
    e_PWQEF_max = max(e_PWQEF)
    
    subplot(1,2,2);
    plot(tt,e_PWQEF,'g','LineWidth',2);
    hold on 

    %title('(b) error','fontname','Times New Roman','Color','b','FontSize',16);
    xlabel('Time(s)','fontname','Times New Roman','FontSize',18);
    ylabel('Absolute error','fontname','Times New Roman','FontSize',16);
    set(gca,'FontName','Times New Roman','FontSize',16);
    legend('PWQEF');

end
    


% clc
% clear
% h = 0.001;
% t = 10/h;
% u = [0, ones(1,t-1,'double')];
% A = [0,  0, -2.2, -1.2; 
%      0,  0,    1,    1; 
%      0,  1,    0,    0;
%      1,  0,    0,    0];
% B = [1; 0; 0; 0];
% C = [0, 0, -2.2, 0];
% D = [1];
% x0 = [0; 0; 0; 0];
% alpha = [0.65, 0.25];
% r = [3,1];
% [x,y] = fossm(u,t,A,B,C,D,x0,alpha,h,r);
% 
% tt = h : h : 10;
% plot(tt,y,tt,u);
% xlabel('t');ylabel('y');



