clc;clf;
d = 3 ;
%%%%%%外环%%%%%%
% 直道
x1 = -12:1:4;
y1 = d/2;
plot(x1,y1,'b*'),hold on
plot(5.5,d/2,'b*'),hold on
% 大环
t1 = pi/2:pi/27:11*pi/6; 
x2 = -12+10.5*cos(t1);
y2 = -10.5+d/2+10.5*sin(t1);
plot(x2,y2,'b*'),hold on
% 小环
t2 = pi/6:pi/18:5*pi/6;
x3 = -12+15*cos(pi/6)+4.5*cos(t2);
y3 = -18+d/2+4.5*sin(t2);
plot(x3,y3,'b*'),hold on 
% 斜道
x4 = (5.5+cos(pi/6)):(5.5+11*cos(pi/6));
y4 = -tan(pi/6)*x4+d/2+5.5*tan(pi/6);
plot(x4,y4,'b*'),hold on
%  中环
t3 = 7*pi/6:pi/18:7*pi/3;
x5 = -12+15*cos(pi/6)+12*cos(pi/6)+7.5*cos(t3);
y5 = -18+12*sin(pi/6)+d/2+7.5*sin(t3);
plot(x5,y5,'b*'),hold on
%%%%%%内环%%%%%%
% 直道
x1 = -12:1:4;
y1 = -d/2;
plot(x1,y1,'r*'),hold on
plot(4.6,-d/2,'r*'),hold on
% 大环
t1 = pi/2:pi/27:11*pi/6; 
x2 = -12+(10.5-d)*cos(t1);
y2 = -10.5+d/2+(10.5-d)*sin(t1);
plot(x2,y2,'r*'),hold on
% 小环
t2 = pi/6:pi/18:5*pi/6;
x3 = -12+15*cos(pi/6)+(4.5+d)*cos(t2);
y3 = -18+d/2+(4.5+d)*sin(t2);
plot(x3,y3,'r*'),hold on 
% 斜道
x4 = 4.6:13.63;
y4 = -tan(pi/6)*x4-d/2+4.6*tan(pi/6);
plot(x4,y4,'r*'),hold on
%  中环
t3 = 7*pi/6:pi/18:7*pi/3;
x5 = -12+15*cos(pi/6)+12*cos(pi/6)+(7.5-d)*cos(t3);
y5 = -18+12*sin(pi/6)+d/2+(7.5-d)*sin(t3);
plot(x5,y5,'r*'),hold on

h = findobj('Type', 'line'); % 查找所有线对象

% 处理每个子图的XData和YData
for i = 1:numel(h)
    xData{i} = get(h(i), 'XData');
    yData{i} = get(h(i), 'YData');
end

% 将 xData 和 yData 连接成一个矩阵
dataMatrix = cell2mat([xData; yData]);
DataMatrix = dataMatrix.'
% 保存数据到文本文件
% writematrix(dataMatrix, 'xyData.txt', 'Delimiter', '\t');
writematrix(DataMatrix, 'xyData.xls');
