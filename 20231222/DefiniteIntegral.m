clc;clear;clf;
particles =  1000 ;
n = 0;x2 = 0:0.01:pi;
x = unifrnd(0,pi,1,particles);
y = unifrnd(0,pi,1,particles);
% for i = 1 : particles
%     if y(i)<sin(x(i))
%         n = n+1;
%     end
% end
n = sum(y < sin(x));
plot(x,y,'r*'),hold on 
plot(x2,sin(x2),'b.')
legend('随机生成的粒子','sinx曲线'),title('示意图')
axis([-0.1 3.2 -0.1 3.2])
p = n/particles*pi*pi;
exact_value = integral(@sin, 0, pi);
fprintf('蒙特卡洛估计值：%f\n', p);
fprintf('精确值：%f\n', exact_value)
