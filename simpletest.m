clear
clc
close all

for k = 6:1:9
R = rand(20,k)*rand(k,20);
R0 = nanGenerator(R,30);
subplot(2,2,k-5);
    for i = 1:10
        for j = 1:1:20
             %[pc,W,data_mean,xr,evals,percentVar]=ppca(R0,i);
 
             %newR = (pinv(W)*pc)+repmat(data_mean,1,size(R0,2));
        
            [W,u,sigma_square,newR] = ppca_yang(R0,i);

            rmse = computeRMSE(newR,R);

            scatter(i,rmse);
            hold on;
        end
        hold on;
    end
hold off;
    %fprintf('%d\n',k);
end

