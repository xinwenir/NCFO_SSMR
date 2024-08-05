function [w, w_linear, s_LinearFit_p, w_quadratic, s_quadraticFit_p] = w_linear_quadratic_gen(L,h,Thn,gam)
t = h : h : Thn;
w = 1.0;
for j = 2 : length(t) % w_0 = 1, w_j = (1 - (\alpha + 1)/j)w_{j-1}, j = 1,2,....
    w(j) = w(j - 1)*(1-(gam + 1)/(j - 1));
end

[LinearFit_res, got_linear] = createFit_Linear(t(L + 1 : end), w(L + 1 : end));
[quadraticFit_res, got_quadratic] = createFit_Quadratic(t(L + 1 : end), w(L + 1 : end));
s_LinearFit_p = [LinearFit_res.p1,LinearFit_res.p2];
s_quadraticFit_p = [quadraticFit_res.p1,quadraticFit_res.p2,quadraticFit_res.p3];

w_linear = w(1 : L);
w_quadratic = w(1 : L);

for wli = L + 1 : length(t)
    w_linear(wli) = LinearFit_res.p1 * (wli * h) + LinearFit_res.p2;
    w_quadratic(wli) = quadraticFit_res.p1 * (wli * h)^2 + quadraticFit_res.p2 * (wli * h) + quadraticFit_res.p3;    
end
%% simulation

% figure('Name', 'w & w_linear & w_quadratic');
% n = 1 : 1 : length(t);
% subplot(3,1,1);
% plot(n,w,'r','LineWidth',3);
% title('(a) w','fontname','Times New Roman','Color','b','FontSize',16);
% xlabel('n','fontname','Times New Roman','FontSize',16);
% ylabel('w','fontname','Times New Roman','FontSize',14);
% set(gca,'FontName','Times New Roman','FontSize',16);
% legend('w');
% 
% subplot(3,1,2);
% plot(n,w_linear,'r','LineWidth',3);
% title('(b) w_linear','fontname','Times New Roman','Color','b','FontSize',16);
% xlabel('n','fontname','Times New Roman','FontSize',16);
% ylabel('w','fontname','Times New Roman','FontSize',14);
% set(gca,'FontName','Times New Roman','FontSize',16);
% legend('w_linear');
% 
% subplot(3,1,3);
% plot(n,w_quadratic,'r','LineWidth',3);
% title('(c) w_quadratic','fontname','Times New Roman','Color','b','FontSize',16);
% xlabel('n','fontname','Times New Roman','FontSize',16);
% ylabel('w','fontname','Times New Roman','FontSize',14);
% set(gca,'FontName','Times New Roman','FontSize',16);
% legend('w_quadratic');
% 
