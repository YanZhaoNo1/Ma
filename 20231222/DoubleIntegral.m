clc;clear;clf;
particles =  1000 ;
n = 0;
fun = @(x, y) 1 + x .* exp(-(x.^2 + y.^2));

x2 = unifrnd(-2,2,1,particles);
y2 = unifrnd(-2,2,1,particles);
z2 = unifrnd(0,1.5,1,particles);
for i = 1 : particles
    if z2(i)<1+x2(i)*exp(-(x2(i)^2+y2(i)^2))
        n = n+1;
    end
end
[x, y] = meshgrid(-2:0.1:2, -2:0.1:2);
z = fun(x, y);
mesh(x, y, z),hold on 
scatter3(x2, y2, z2, 'r.')
legend('二重积分曲线','随机生成的粒子'),title('示意图')

p = n/particles*1.5*4*4;
exact_value = integral2(fun, -2, 2, -2, 2);
fprintf('蒙特卡洛估计值：%f\n', p);
fprintf('精确值：%f\n', exact_value)


