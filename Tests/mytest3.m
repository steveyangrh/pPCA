%% Ronghao Yang

function [recoverMean,recoverStd] = mytest3(n,m,myrank)

    %addpath('..');
    addpath('../../nnmf/tests');
    addpath('../../nnmf/RIEDl');
    
    recoverbank = zeros(10,10);
    
    for i = 1:10
        
        for j = 0:10:90
            
            R0 = rand(n,myrank) * rand(myrank,m);
            R = nanGenerator(R0,j);
            [~,~,~,~,~,S] = ppca(R,myrank); 
            PM = matrixComparision(R0,S.Recon);
            recoverbank(i,(j/10)+1) = PM;
           
        end
    end

    recoverMean = mean(recoverbank);
    recoverStd = std(recoverbank);
end