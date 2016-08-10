function [rbest] = ppca_predict(r,W,u,sigma_square)

	[n,m] = size(W);

	SIG = W * W' + sigma_square * eye(n);

	rNan = find(isnan(r));

    rNoNan = find(~isnan(r));
    
    r0 = r(rNoNan);
    
    u0 = u(rNoNan);
    
    uh = u(rNan);
    
    SIG_OO = SIG (rNoNan,rNoNan);
    
    SIG_HO = SIG (rNan,rNoNan);
    
    r(rNan) = uh + SIG_HO*SIG_OO^(-1)*(r0-u0);

    rbest = r;

end