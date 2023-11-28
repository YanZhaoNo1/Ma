clc;clf;
% 由方程x^2/9+y^2/16+z^2/4=1可知，要绘制的图形为椭球形
% 使用ellipsoid函数构建椭球形，并改变观察点获得各个坐标面的投影
subplot(2,2,1)
xc=0;yc=0;zc=0;
xr=3;yr=4;zr=2;n=20;
[x,y,z]=ellipsoid(xc,yc,zc,xr,yr,zr,n);
mesh(x,y,z)
view(3)
colormap copper
xlabel("x"),zlabel("z"),ylabel("y")
title("立体图")
% 俯视图从Z方向
subplot(2,2,2),mesh(x,y,z),view([0,0,1])
colormap copper
title("俯视图"),xlabel("x"),ylabel("y")
% 正视图从Y方向
subplot(2,2,3),mesh(x,y,z),view([0,1,0])
colormap copper
title("正视图"),xlabel("x"),zlabel("z")
% 侧视图从Y方向
subplot(2,2,4),mesh(x,y,z),view([1,0,0])
colormap copper
title("侧视图"),ylabel("y"),zlabel("z")