clc;
disp("输入Ctrl+c 退出程序")
while(1)
    prompt = '请输入你的成绩：';
    n = input (prompt);
    if n >= 90 & n <= 100
        disp("优秀")
    elseif n >= 80 & n < 90
        disp("良好")
    elseif n >= 60 & n < 80
        disp("及格")
    elseif n >= 0 & n < 60
        disp("不及格")
    elseif n > 100 | n < 0
        disp("你输入的成绩无效请重新输入!")
    end
end
