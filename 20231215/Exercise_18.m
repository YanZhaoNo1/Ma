clc;clear;
%根号二的值
% showstring = ['根号二的值为',num2str(sqrt(2))];
showsqrt2 = sprintf('根号二的值为 %0.15f',sqrt(2));
disp(showsqrt2)

h=0.01;x=0:h:pi/4;
y=1./(1-sin(x));
% 矩形法 Approximate value of left rectangle
AVOLT=sum(y(1:length(x)-1))*h; %左矩形公式
AVORT=sum(y(2:length(x)))*h; %右矩形公式
showAVOLT = sprintf('左矩形公式求得近似值为 %0.15f',AVOLT);
showAVORT = sprintf('右矩形公式求得近似值为 %0.15f',AVORT);
% 复合梯形法 Approximate value obtained by compound trapezoid
AVOBCT = trapz(x,y); %复合梯形公式
showAVOBCT = sprintf('复合梯形公式求得近似值为 %0.15f',AVOBCT);
% 复合辛普生公式 Approximate value obtained by compound Simpson's formula
AVOBCSF = quad('1./(1-sin(x))',0,pi/4);
showAVOBCSF = sprintf('复合辛普生公式求得近似值为 %0.15f',AVOBCSF);
disp(showAVOLT)
disp(showAVORT)
disp(showAVOBCT)
disp(showAVOBCSF)