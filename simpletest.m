clear
clc
close all

% addpath('./ppca_mv');
% addpath('../mat');
% load('R.mat');
addpath('../nnmf/RIEDL');
addpath('../nnmf/tests');


R0 = rand(200,10)*rand(10,30);

R = nanGenerator(R0,30);

[W,u,sigma_square,R] = ppca_ryang_n_1(R,10);

colIndex = randperm(30);

R0new = R0(:,colIndex);

Rnew = nanGenerator(R0new,90);

for i = 1:30
   [rbest] = ppca_predict(Rnew(:,i),W,u,sigma_square);
    
   Rpredict(:,i) = rbest; 
end

PM = matrixComparision(R0new,Rpredict)
