%% ppca_yang: probabilistic PCA for player modeling
% R0 is the input matrix which contains missing values
% k is the number of basis

% E-M algorithm is employed here 

% Created on August 5, 2016
% Ronghao Yang
function [W,u,sigma_square,R] = ppca_yang_2(R0,k)