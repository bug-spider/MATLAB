clc;clear;

%读取数据
fh = load('已处理数据（1）.txt');
fh = fh(:,1:3);
x = fh(:,1);
y = fh(:,2);
z = fh(:,3);
figure(1)
plot3(x,y,z,'yo'); hold on
xlabel('x');
ylabel('y');
zlabel('z');
% 分别拟合两个二维的曲线，然后统一到一起
eqn_yx = polyfit(y,x,2);
x_po = polyval(eqn_yx, y);
eqn_yz = polyfit(y,z,2);
z_po = polyval(eqn_yz, y);
plot3(x_po ,y, z_po, 'r*'); hold on;
% 得出曲线误差曲线，检验拟合结果
eqn_zx_po = polyfit(z_po,x_po,2);   
x_po_f = polyval(eqn_zx_po,z_po);
plot3(x_po_f,y,z_po,'b*'); hold on;
