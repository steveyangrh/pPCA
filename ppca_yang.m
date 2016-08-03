%% ppca_yang: probabilistic PCA for player modeling
% R0 is the input matrix which contains missing values
% k is the number of basis

% E-M algorithm is employed here 

% Created on July 21, 2016
% Ronghao Yang
function [W,u,sigma_square,R] = ppca_yang(R0,k)

	[n,m] = size(R0);
    R = R0;
    
	indexNotNan = find(~isnan(R0));
	% indexNotNan has the indices of all non-nan values

	W = rand(n,k);
	% initialize W with a random matrix
    
    u = rand(n,1);
    % initialize u with a random vector, u is mean
    
    sigma_square = rand;
    % sigma is standard deviation
    

	minImprovement = 0.0001;
	rmse = 10^40;
	prevErr = Inf;
  	% specify the stop condition

	while(rmse < (1-minImprovement)*prevErr)
  	% the iterative step for minimizing the error

	  	% Expectation step (E)
        SIG = W*W' + sigma_square.*eye(n);
        for i=1:m
            r = R0(:,i);
            rNoNan = find(~isnan(r));
            rNan = find(isnan(r));
            r0 = r(rNoNan);
            u0 = u(rNoNan);
            uh = u(rNan);
            SIG_OO = SIG (rNoNan,rNoNan);
            SIG_HO = SIG (rNan,rNoNan);
            r(rNan) = uh + SIG_HO*inv(SIG_OO)*(r0-u0);
            R(:,i) = r;
        end
        
        C = zeros(n,n);
	  	% The minimization step (M)
        for i = 1:m
            r = R(:,i);
            C = C + (r-u)*(r-u)';
        end
        
        C = C / m;
        
        u = sum(R,2);
        
        [U,D] = eigs(C,k);
        
        sigma_square = (trace(C)-trace(D))/(n-k);
        
        S = D- sigma_square;
        
        W = U*S;

	    % Compute the error
	    prevErr = rmse;
	    rmse = computeRMSE(R0,R);

	end

end
