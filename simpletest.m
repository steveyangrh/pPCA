clear
clc
close all

addpath('./ppca_mv');
addpath('../mat');
load('R.mat');

R0 = rand(20,7)*rand(7,20);
R0_missing = nanGenerator(R0,0.25);

subplot(1,1,1);

for k = 1:10
    
    for i = 1:20
        [pc,W,data_mean]= ppca(R0_missing,k);

        %[pc,W,data_mean,xr,evals,percentVar]=ppca_origin(R0_missing,k);

        data_recon = (pinv(W)*pc)+repmat(data_mean,1,size(R0_missing,2));

        rmse = computeRMSE(R0,data_recon);

        scatter(k,rmse);

        hold on;
    
    end

end