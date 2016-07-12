clear;
close all;
clc;

A = [2.5 2.4;0.5 0.7;2.2 2.9;1.9 2.2;3.1 3.0;2.3 2.7;2 1.6;1 1.1;1.5 1.6;1.1 0.9];
A_ad = [A(:,1)-mean(A(:,1)) A(:,2)-mean(A(:,2))];

B = A_ad';

C_Aad = cov(A_ad);
[V_Aad,D_Aad] = eig(C_Aad);


%[V_Bad,D_Bad] = eig(B*B')



