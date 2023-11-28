clc;
t=0:pi/10:20*pi;
x = t.*cos(pi/6.*t);
y = t.*sin(pi/6.*t);
z = 2*t;
plot3(x,y,z)
title('螺旋线')
xlabel('x轴'),ylabel('y轴'),zlabel('z轴')
text(0,0,80,'螺旋线')
legend("螺旋线")


