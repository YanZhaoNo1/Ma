clc;clear;
load MathData.txt;
[N,X]=hist(MathData,7);
hist(MathData,7)
title("频数直方图")
DataAverage = mean(MathData);
DataVariance = var(MathData);
showDataAverage = sprintf('样本均值为 %0.2f',DataAverage);
showDataVariance = sprintf('样本方差为 %0.2f',DataVariance);
disp(showDataAverage)
disp(showDataVariance)