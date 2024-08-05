clc;
clear;
close all;
% test1_L_COM = 1;
test2_Ms_COM = 1;
fid  = fopen('test2\dy_rom.dat','r');
if exist('test1_L_COM','var')
    fid1 = fopen('test2\dy_rom1.dat','r');
    fid2 = fopen('test2\dy_rom2.dat','r');
    fid3 = fopen('test2\dy_rom3.dat','r');
end
fid4 = fopen('test2\dy_rom4.dat','r');
fid5 = fopen('test2\dy_rom5.dat','r');

dataCell = textscan(fid,'%s','headerlines',1);
[r,c] = size(dataCell{1,1});

if exist('test1_L_COM','var')
    dataCell1 = textscan(fid1,'%s','headerlines',1);
    [r1,c1] = size(dataCell1{1,1});

    dataCell2 = textscan(fid2,'%s','headerlines',1);
    [r2,c2] = size(dataCell2{1,1});

    dataCell3 = textscan(fid3,'%s','headerlines',1);
    [r3,c3] = size(dataCell3{1,1});
end
dataCell4 = textscan(fid4,'%s','headerlines',1);
[r4,c4] = size(dataCell4{1,1});

dataCell5 = textscan(fid5,'%s','headerlines',1);
[r5,c5] = size(dataCell5{1,1});

i = 1;
while i < 4998
    data = cell2mat(dataCell{1,1}(i));
    dy(i) = typecast(uint32(hex2dec(data)),'single');
    i = i + 1;
end
if exist('test1_L_COM','var')
    i = 1;
    while i < 4998
        data1 = cell2mat(dataCell1{1,1}(i));
        dy1(i) = typecast(uint32(hex2dec(data1)),'single');
        i = i + 1;
    end
    i = 1;
    while i < 4998
        data2 = cell2mat(dataCell2{1,1}(i));
        dy2(i) = typecast(uint32(hex2dec(data2)),'single');
        i = i + 1;
    end
    i = 1;
    while i < 4998
        data3 = cell2mat(dataCell3{1,1}(i));
        dy3(i) = typecast(uint32(hex2dec(data3)),'single');
        i = i + 1;
    end 
end
i = 1;
while i < 4998
    data4 = cell2mat(dataCell4{1,1}(i));
    dy4(i) = typecast(uint32(hex2dec(data4)),'single');
    i = i + 1;
end
i = 1;
while i < 4998
    data5 = cell2mat(dataCell5{1,1}(i));
    dy5(i) = typecast(uint32(hex2dec(data5)),'single');
    i = i + 1;
end
h = 0.01;
Thn = 50;
tt = h:h:Thn;
t = Thn/h;
pi = 3.1415926;
u = sin(pi*tt);
alpha = 0.8;
[dy_o] = GLF_Original(u,t,alpha,h,2048);
[dy_pwl] = GLF_PWL(u,t,alpha,h,2048);
if exist('test2_Ms_COM','var')  
    [dy_linear] = GLF_Linear(u,t,alpha,h,256);
    [dy_quadratic] = GLF_Quadratic(u,t,alpha,h,256);
end

figure('name','test1')
dy(4998) = dy(4997);dy(4999) = dy(4997);dy(5000) = dy(4997);
if exist('test1_L_COM','var')
    dy1(4998) = dy1(4997);dy1(4999) = dy1(4997);dy1(5000) = dy1(4997);
    dy2(4998) = dy2(4997);dy2(4999) = dy2(4997);dy2(5000) = dy2(4997);
    dy3(4998) = dy3(4997);dy3(4999) = dy3(4997);dy3(5000) = dy3(4997);
end
dy4(4998) = dy4(4997);dy4(4999) = dy4(4997);dy4(5000) = dy4(4997);
dy5(4998) = dy5(4997);dy5(4999) = dy5(4997);dy5(5000) = dy5(4997);

subplot(1,2,1); 
if exist('test1_L_COM','var')
    plot(tt,dy1,'r--x','MarkerIndices',1:100:length(dy),'LineWidth',2);
    hold on
    plot(tt,dy2,'--k','LineWidth',2);
    hold on
    plot(tt,dy3,'-.c','LineWidth',2);
    hold on
elseif exist('test2_Ms_COM','var')   
    plot(tt,dy_linear,'--k','LineWidth',2);
    hold on
    plot(tt,dy_quadratic,'-.c','LineWidth',2);
    hold on
end
% plot(tt,dy4,':m','LineWidth',2);
% hold on 
plot(tt,dy5,'g','LineWidth',2);
hold on 
plot(tt,dy_pwl,'y','LineWidth',2);
hold on 
plot(tt,dy, 'b-o','MarkerIndices',1:150:length(dy), 'LineWidth',2);
hold on
xlabel('Time(s)','fontname','Times New Roman','FontSize',18);
ylabel('Amplitude','fontname','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','FontSize',16);
if exist('test1_L_COM','var')
    legend('L=64','L=128','L=256','L=512','L=1024','PWL','PWQEF');
elseif exist('test2_Ms_COM','var')   
    legend('L-linear','L-quadratic','L=1024','PWL','PWQEF');
end

e_PWQEF = abs(dy_o - dy);   e_PWQEF_max = max(e_PWQEF)
if exist('test1_L_COM','var')
    e_64 = abs(dy_o - dy1);     e_64_max = max(e_64)
    e_128 = abs(dy_o - dy2);    e_128_max = max(e_128)
    e_256 = abs(dy_o - dy3);    e_256_max = max(e_256)
elseif exist('test2_Ms_COM','var')   
    e_linear = abs(dy_o - dy_linear);     e_linear_max = max(e_linear)
    e_quadratic = abs(dy_o - dy_quadratic);     e_quadratic_max = max(e_quadratic)
end
e_512 = abs(dy_o - dy4);    e_512_max = max(e_512)
e_1024 = abs(dy_o - dy5);   e_1024_max = max(e_1024)
e_pwl = abs(dy_o - dy_pwl); e_pwl_max = max(e_pwl)
    
subplot(1,2,2); 
if exist('test1_L_COM','var')
    plot(tt,e_64,'--b','LineWidth',2);
    hold on
    plot(tt,e_128,'-.c','LineWidth',2);
    hold on
    plot(tt,e_256,':m','LineWidth',2);
    hold on
elseif exist('test2_Ms_COM','var')   
    plot(tt,e_linear,'--b','LineWidth',2);
    hold on 
    plot(tt,e_quadratic,'-.c','LineWidth',2);
    hold on 
end
% plot(tt,e_512,'g','LineWidth',2);
% hold on 
plot(tt,e_1024,'--k','LineWidth',2);
hold on 
plot(tt,e_pwl,'y','LineWidth',2);
hold on
plot(tt,e_PWQEF,'r--x','MarkerIndices',1:100:length(dy),'LineWidth',2);
hold on
%title('(b) error','fontname','Times New Roman','Color','b','FontSize',16);
xlabel('Time(s)','fontname','Times New Roman','FontSize',18);
ylabel('Absolute error','fontname','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','FontSize',16);
if exist('test1_L_COM','var')
    legend('L=64','L=128','L=256','L=512','L=1024','PWL','PWQEF');
elseif exist('test2_Ms_COM','var')   
    legend('L-linear','L-quadratic','L=1024','PWL','PWQEF');
end






% clc;clear;close all;
% data = importdata('dy_rom.dat');
% RC = size(data);%¾ØÕó³ß´ç
% R = RC(1);%¾ØÕóÐÐÊý
% C = RC(2);%¾ØÕóÁÐÊý  
% data_out = reshape(data,R*C,1);