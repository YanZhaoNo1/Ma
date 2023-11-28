clc;
x1 = -pi:0.1:pi;
x2 = pi:0.1:4*pi;
x3 = 1:0.1:8;
y1 = x1.*cos(x1);
y2 = x2.*tan(1./x2).*sin(x2.^3);
y3 = exp(1./x3).*sin(x3);
plot(x1,y1,'r*',x2,y2,'b-',x3,y3,'g.')
title('三条曲线')
xlabel('x轴'),ylabel('y轴')
gtext('y=xcos(x)')
gtext('y=xtan(1/x)sin(x^3)')
gtext('y=exp(1/x)sin(x)')
legend('y=xcos(x)','y=xtan(1/x)sin(x^3)','y=exp(1/x)sin(x)')
axis auto;


