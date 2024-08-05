%%__________________________________________________________________
% PID & FOPID Controller
%
%
%

clc
clear
h = 0.01;
Thn = 35;
tt = h : h : Thn;
t = Thn/h;
%% test1
u = [1, ones(1,t-1,'double')];
A1 = [-1.2/2.2,   1;
      -1/2.2,   0];
B1 =  [0; 1/2.2];
C1 =  [1, 0]
D1 = 0;
x01 = [0; 0];
alpha1 = [1.3, 0.9];
r1 = [1,1];

%% test1-PID
n1 = 52/155;
n2 = 177/248;
d1 = 5/124;
d2 = 129/310;
d3 = 2/31;
d4 = 177/248;

A2 = [0, 1, -d2/d3, -d2/d3;
     0, 0, -1/d3 , -1/d3 ;
     1, 0, -d1/d3, -d1/d3;
     0, 0, -d4/d3, -d4/d3];
B2 = [n1/d3; 1/d3; 0; n2/d3];
C2 = [0, 0, 1, 1];
D2 = 0;
x02 = [0; 0; 0; 0];
alpha2 = [0.9, 0.98, 1.3, 1.05];
r2 = [1,1,1,1];
% mL = 1;
%% TEST-E1-Q
% u = [1, ones(1,t-1,'double')];
n1 = 1257/1500;
n2 = 1;
d1 = 16/15;
d2 = 1257/1500;
d3 = 4/75;
d4 = 1/30;

A3 = [0, 1, -d1/d3, -d1/d3;
     0, 0, -1/d3 , -1/d3 ;
     1, 0, -d2/d3, -d2/d3;
     0, 0, -d4/d3, -d4/d3];
B3 = [n2/d3; 1/d3; n1/d3; 0];
C3 = [0, 0, 1, 1];
D3 = 0;
x03 = [0; 0; 0; 0];
alpha3 = [1, 1.2, 1.3];
r3 = [2,1,1];
mL = 1;


[x1,y1] = fossm(u,t,A1,B1,C1,D1,x01,alpha1,h,r1);
[x2,y2] = fossm(u,t,A3,B3,C3,D3,x03,alpha3,h,r3);
[x3,y3] = fossm(u,t,A2,B2,C2,D2,x02,alpha2,h,r2);
figure('name','test')

plot(tt, y1, '--b', 'LineWidth',2);
hold on 
plot(tt, y2,'-.r','LineWidth',2);
hold on 
plot(tt, y3,':K','LineWidth',2);
hold on 

%title('(a) comparison','fontname','Times New Roman','Color','b','FontSize',16);
xlabel('Time(s)','fontname','Times New Roman','FontSize',16);
ylabel('Amplitude','fontname','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','FontSize',16);
legend('y','y-PID','y-FOPID');
