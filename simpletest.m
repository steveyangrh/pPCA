clear
clc
close all

addpath('./ppca_mv');
addpath('../mat');
load('R.mat');

R0 = rand(20,7)*rand(7,20);
R0_missing = nanGenerator(R0,0);
r0 = R0(:,1);
r0_missing = nanGenerator(r0,70);
[pc,W,data_mean]=ppca(R0_missing,7);

data_recon = (pinv(W)*pc)+repmat(data_mean,1,size(R0,2));

