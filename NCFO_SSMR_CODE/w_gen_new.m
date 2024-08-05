function [w, w_nf, nsp,t] = w_gen_new(gam,h,Thn) % The minimum value of L is 256
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
w_nf = ones(1,length(t));

nsp = 1;
% figure('Name', 'w & wqf & wlf');
% n = 1 : 1 : length(t);
% subplot(1,3,1);
% plot(n(L1 + 1 : L4),w(L1 + 1 : L4),'r','LineWidth',3);
% hold on
% plot(n(L1 + 1 : L4),w_qf(L1 + 1 : L4),'b','LineWidth',3);
% hold on
% plot(n(L1 + 1 : L4),w_lf(L1 + 1 : L4),'g','LineWidth',3);
% hold on
% % title('(a) L1 -- L2','fontname','Times New Roman','Color','b','FontSize',16);
% xlabel('n','fontname','Times New Roman','FontSize',16);
% ylabel('w','fontname','Times New Roman','FontSize',14);
% set(gca,'FontName','Times New Roman','FontSize',16);
% legend('w','wqf','wlf');
% 
% subplot(1,3,2);
% plot(n(L1 + 1 : L4),e_w_qf(L1 + 1 : L4),'r','LineWidth',3);
% hold on
% plot(n(L1 + 1 : L4),e_w_lf(L1 + 1 : L4),'b','LineWidth',3);
% hold on
% % title('(b) L2 -- L3','fontname','Times New Roman','Color','b','FontSize',16);
% xlabel('n','fontname','Times New Roman','FontSize',16);
% ylabel('w','fontname','Times New Roman','FontSize',14);
% set(gca,'FontName','Times New Roman','FontSize',16);
% legend('ewqf','ewlf');
% 
% subplot(1,3,3);
% plot(n(L1 + 1 : L4),er_w_qf(L1 + 1 : L4),'r','LineWidth',3);
% hold on
% plot(n(L1 + 1 : L4),er_w_lf(L1 + 1 : L4),'b','LineWidth',3);
% hold on
% % title('(b) L2 -- L3','fontname','Times New Roman','Color','b','FontSize',16);
% xlabel('n','fontname','Times New Roman','FontSize',16);
% ylabel('w','fontname','Times New Roman','FontSize',14);
% set(gca,'FontName','Times New Roman','FontSize',16);
% legend('erwqf','erwlf');

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
