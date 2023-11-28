clc;clf;
% 生成三维曲面z=5-x^2-y^2
t = -2:0.01:2;
[x,y] = meshgrid(t);
z1 = 5-x.^2-y.^2;
subplot(2,1,1),mesh(x,y,z1)
title("三维曲面"),xlabel("x"),ylabel("y"),zlabel("z")
% 生成平面z=3
z2 = 3*ones(size(x));
% 生成交线
r0 = abs(z1-z2)<= 0.01;
zz = r0.*z2;yy = r0.*y;xx = r0.*x;
subplot(2,1,2)
plot3(xx(r0~=0),yy(r0~=0),zz(r0~=0),"rx")
title('交线'),xlabel("x"),ylabel("y"),zlabel("z")


