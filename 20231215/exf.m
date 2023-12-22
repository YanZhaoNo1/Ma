% function [outputArg1,outputArg2] = exf(inputArg1,inputArg2)
% %EXF 此处显示有关此函数的摘要
% %   此处显示详细说明
% outputArg1 = inputArg1;
% outputArg2 = inputArg2;
% end
function xdot=exf(t,x)
u=1-2*t;
xdot=[0,1;1,-t]*x+[0 ;1]*u;
