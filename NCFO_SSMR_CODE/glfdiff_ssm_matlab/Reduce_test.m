clc
clear

%%
h = 0.01;
Thn = 50;
tt1 = h : h : Thn;
t = Thn/h;

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
%% Gen A,B,C,D,h_q,alpha
A_str = num2hex(single(A))
B_str = num2hex(single(B))
C_str = num2hex(single(C))
D_str = num2hex(single(D))
x0_str = num2hex(single(x0))
alpha_str = num2hex(single(alpha))
u_str = num2hex(single(u));
writematrix(u_str,'u_rom_t1.txt','Delimiter','tab');
%% Gen quadratic coefficients
% [c_sx] = gen_pwqef_parameters(t,alpha,h,r,1024);
[c_sx] = gen_xxx_parameters(t,alpha,h,r,1024,'linear');
c_sx_str = num2hex(single(c_sx));
writematrix(c_sx_str,'c_sxstr_t1.txt','Delimiter','tab');
%% simulation
[x_t1,y_t1] = fossm(u,t,A,B,C,D,x0,alpha,h,r);
% [x_PWQEF,y_PWQEF] = fossm_PWQEF(u,t,A,B,C,D,x0,alpha,h,r,2048);
[x_PWQEF_t1,y_PWQEF_t1] = fossm_PWL(u,t,A,B,C,D,x0,alpha,h,r,1024);
%% Gen y_PWQEF coefficients
y_PWQEF_str = num2hex(single(y_PWQEF_t1));
writematrix(y_PWQEF_str,'y_PWQEF_str_t1.txt','Delimiter','tab');

%% 
h = 0.002;
Thn = 10;
tt2 = h : h : Thn;
t = Thn/h;

%% Reduce FPGA test2 Original
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
u = 100 .* sin(tt2.^2);
A = [ -8, 1, 0,  -8, 0, 0;
       0, 0, 0,   0, 1, 0;
     -90, 0, 0, -90, 0, 0;
     -26, 0, 0, -26, 0, 0;
     -73, 0, 1, -73, 0, 1;
       0, 0, 0,   0, 0, 0]; 
B = [0; 0; 0; 0; 0; 1];
C = [1, 0, 0, 1, 0, 0];
D = 0;
x0 = [0; 0; 0;  0;  0;  0];
alpha = [0.4, 0.7, 1.2];
r = [1, 2, 3];  
mL = 1;
%% Gen A,B,C,D,h_q,alpha
A_str = num2hex(single(A))
B_str = num2hex(single(B))
C_str = num2hex(single(C))
D_str = num2hex(single(D))
x0_str = num2hex(single(x0))
alpha_str = num2hex(single(alpha))
u_str = num2hex(single(u));
writematrix(u_str,'u_rom_t2.txt','Delimiter','tab');
%% Gen quadratic coefficients
% [c_sx] = gen_pwqef_parameters(t,alpha,h,r,1024);
[c_sx] = gen_xxx_parameters(t,alpha,h,r,1024,'linear');
c_sx_str = num2hex(single(c_sx));
writematrix(c_sx_str,'c_sxstr_t2.txt','Delimiter','tab');
%% simulation
[x_t2,y_t2] = fossm(u,t,A,B,C,D,x0,alpha,h,r);
% [x_PWQEF,y_PWQEF] = fossm_PWQEF(u,t,A,B,C,D,x0,alpha,h,r,2048);
[x_PWQEF_t2,y_PWQEF_t2] = fossm_PWL(u,t,A,B,C,D,x0,alpha,h,r,1024);
%% Gen y_PWQEF coefficients
y_PWQEF_str = num2hex(single(y_PWQEF_t2));
writematrix(y_PWQEF_str,'y_PWQEF_str_t2.txt','Delimiter','tab');

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
    aplot = plot(tt2, y_t2, 'b-o','MarkerIndices',1:150:length(y_t2), 'LineWidth',2);
    % plot(tt,y,'--yp','LineWidth',2,... %设置线宽为2  
    %                 'MarkerSize',10,... %设置标记点的尺寸/大小为10号
    %                 'MarkerFaceColor','y',... %设置标记点填充颜色为黄色
    %                 'MarkerEdgeColor','k') %设置标记点边缘颜色为黑色
    % aplot.Color(4) = 0.2;
    hold on 
    dplot = plot(tt2,y_PWQEF_t2,'g','LineWidth',2);
    % dplot.Color(4) = 0.2;
    hold on 

    %title('(a) comparison','fontname','Times New Roman','Color','b','FontSize',16);
    xlabel('Time(s)','fontname','Times New Roman','FontSize',18);
    ylabel('Amplitude','fontname','Times New Roman','FontSize',16);
    set(gca,'FontName','Times New Roman','FontSize',16);
    legend('Theoretical','HW-Simulator');

    subplot(1,2,2);
    aplot = plot(tt1, y_t1, 'b-o','MarkerIndices',1:150:length(y_t1), 'LineWidth',2);
    % plot(tt,y,'--yp','LineWidth',2,... %设置线宽为2  
    %                 'MarkerSize',10,... %设置标记点的尺寸/大小为10号
    %                 'MarkerFaceColor','y',... %设置标记点填充颜色为黄色
    %                 'MarkerEdgeColor','k') %设置标记点边缘颜色为黑色
    % aplot.Color(4) = 0.2;
    hold on 
    dplot = plot(tt1,y_PWQEF_t1,'g','LineWidth',2);
    % dplot.Color(4) = 0.2;
    hold on 

    %title('(b) error','fontname','Times New Roman','Color','b','FontSize',16);
    xlabel('Time(s)','fontname','Times New Roman','FontSize',18);
    ylabel('Amplitude','fontname','Times New Roman','FontSize',16);
    set(gca,'FontName','Times New Roman','FontSize',16);
    legend('Theoretical','HW-Simulator');
%     e_PWQEF = abs(y - y_PWQEF);
%     e_PWQEF_max = max(e_PWQEF)
%     
%     subplot(1,2,2);
%     plot(tt,e_PWQEF,'g','LineWidth',2);
%     hold on 
% 
%     %title('(b) error','fontname','Times New Roman','Color','b','FontSize',16);
%     xlabel('Time(s)','fontname','Times New Roman','FontSize',18);
%     ylabel('Absolute error','fontname','Times New Roman','FontSize',16);
%     set(gca,'FontName','Times New Roman','FontSize',16);
%     legend('PWQEF');

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



