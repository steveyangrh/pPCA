n=30;m=30;myrank=10;
R0 = rand(n,myrank) * rand(myrank,m);
R = nanGenerator(R0,30);
[coeff,score,pcvar,mu,v,S] = ppca(R,10);
matrixComparision(R0,S.Recon);

