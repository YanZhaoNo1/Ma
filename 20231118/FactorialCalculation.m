clc;
prompt = '请输入你想获取的阶乘的累和： ';
n = input(prompt);
i = 1;
f = 0;
for i = i:n
    f = f + factorial(i);
end
disp(['阶乘的累和为: ' num2str(f)])

