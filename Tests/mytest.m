%% Ronghao Yang

function [recoverMean,recoverStd] = mytest(n,m,myrank,MinTrain)

    addpath('..');
    addpath('../../nnmf/tests');
    addpath('../../nnmf/RIEDl');
    
    recoverbank = zeros(10,10);
    
    for i = 1:10
        R0 = rand(n,myrank) * rand(myrank,m);
        R = nanGenerator(R0,MinTrain);
        [W,u,sigma_square,~] = ppca_yang_n(R,myrank);
        
        for j = 0:10:90
            
            colIndex = randperm(m);
            R0new = R0(:,colIndex);
            Rnew = nanGenerator(R0new,j);
            [Rpredict] = ppca_predict(Rnew,W,u,sigma_square);
            PM = matrixComparision(R0new,Rpredict);
            recoverbank(i,(j/10)+1) = PM;
           
        end
    end

    recoverMean = mean(recoverbank);
    recoverStd = std(recoverbank);
end