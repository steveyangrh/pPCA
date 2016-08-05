clear
clc
close all

for k = 6:1:9
R = rand(20,k)*rand(k,20);
R0 = nanGenerator(R,0);
subplot(2,2,k-5);
    for i = 1:10
        for j = 1:1:5
             [pc,W,data_mean,xr,evals,percentVar]=ppca(R0,i);
 
             %newR = (pinv(W)*pc)+repmat(data_mean,1,size(R0,2));
        
            %[coeff,score,pcvar,mu,v,S] = ppca(R0,i);
            
            %newR = score*coeff' + repmat(mu,20,1);
                
            rmse = computeRMSE(xr,R);

            scatter(i,rmse);
            hold on;
        end
        hold on;
    end
hold off;
    %fprintf('%d\n',k);
end



