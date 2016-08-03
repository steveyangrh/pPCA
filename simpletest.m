clear
clc
close all

for k = 6:1:6
R0_origin = rand(200,k)*rand(k,200);
R0 = nanGenerator(R0_origin,80);
subplot(2,2,k-5);
    for i = 1:10
        for j = 1:1:20
            [pc,W,data_mean,xr,evals,percentVar]=ppca(R0,i);

            data_recon = (pinv(W)*pc)+repmat(data_mean,1,size(R0,2));

            rmse = computeRMSE(R0_origin,data_recon);

            scatter(i,rmse);
            hold on;
        end
        hold on;
    end
hold off;
    %fprintf('%d\n',k);
end




