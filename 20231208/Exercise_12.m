clc;clf;clear;
[x,y]=meshgrid(-3:.5:3);
z=x.^2./16-y.^2./16;
[x1,y1]=meshgrid(-3:.1:3);
z1=x1.^2./16-y1.^2./16;

figure(1)
subplot(1,2,1),mesh(x,y,z),title('数据点')
subplot(1,2,2),mesh(x1,y1,z1),title('函数图象')

[xi,yi]=meshgrid(-2:.1:2);
zi1=interp2(x,y,z,xi,yi,'*nearest');
zi2=interp2(x,y,z,xi,yi,'*linear');
zi3=interp2(x,y,z,xi,yi,'*spline');
zi4=interp2(x,y,z,xi,yi,'*cubic');
figure(2)
subplot(221),mesh(xi,yi,zi1),title('最近点插值')
subplot(222),mesh(xi,yi,zi2),title('线性插值')
subplot(223),mesh(xi,yi,zi3),title('样条插值')
subplot(224),mesh(xi,yi,zi4),title('立方插值')