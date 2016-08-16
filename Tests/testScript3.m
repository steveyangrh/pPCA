clear
close all
clc

n = 10; m=10; myrank=10; nanPercentage=30; range = 0:10:90;
[rmseMean1,rmseStd1] = mytest3(n,m,myrank);
n = 30;m=30;
[rmseMean2,rmseStd2] = mytest3(n,m,myrank);
n = 50;m=50;
[rmseMean3,rmseStd3] = mytest3(n,m,myrank);
n = 100;m=100;
[rmseMean4,rmseStd4] = mytest3(n,m,myrank);
n = 200;m=200;
[rmseMean5,rmseStd5] = mytest3(n,m,myrank);


subplot(1,1,1);
title('rnd | rank 10| pPCA trials 10 | Matlab pPCA | \epsilon 10%'); % | \epsilon 10%
xlabel('missing values in new R %');
ylabel('Values Misrecovered %');
hold on;
box on;
grid on;

legendStr = {};
% legendStr = [legendStr sprintf('%d x %d',10,10)]
% errorbar(range,rmseMean1,rmseStd1,'r^-');
% legend(legendStr,'Location','NW');

legendStr = [legendStr sprintf('%d x %d',30,30)]
errorbar(range,rmseMean2,rmseStd2,'ms-');
legend(legendStr,'Location','NW');

legendStr = [legendStr sprintf('%d x %d',50,50)]
errorbar(range,rmseMean3,rmseStd3,'gh-');
legend(legendStr,'Location','NW');

legendStr = [legendStr sprintf('%d x %d',100,100)]
errorbar(range,rmseMean4,rmseStd4,'ko-');
legend(legendStr,'Location','NW');

legendStr = [legendStr sprintf('%d x %d',200,200)]
errorbar(range,rmseMean5,rmseStd5,'bo-');
legend(legendStr,'Location','NW');