%% ppca_yang: probabilistic PCA for player modeling
% R0 is the input matrix which contains missing values
% k is the number of basis

% E-M algorithm is employed here 

% Created on August 2, 2016
% Ronghao Yang
function [W,u,sigma_square,R] = ppca_yang_n_1(R0,k)

	[n,m] = size(R0);
    R = R0;
    
	% indexNotNan = find(~isnan(R0));
	% indexNotNan has the indices of all non-nan values

	W = rand(n,k);
	% initialize W with a random matrix
    
    u = nanmean(R0,2); % suspecious, does this number have to be rand?
    % initialize u
    
    sigma_square = rand;
    % sigma is standard deviation
    

	minImprovement = 0.00001;
	rmse = 10^40;
	prevErr = Inf;
  	% specify the stop condition

	while(rmse < (1-minImprovement)*prevErr)
  	% the iterative step for minimizing the error

	  	% Expectation step (E)
        SIG = W * W' + sigma_square.*eye(n); % covariance matrix for vector r
        for i=1:m
            r = R0(:,i);
            rNan = find(isnan(r));
            rNoNan = find(~isnan(r));
            r0 = r(rNoNan);
            u0 = u(rNoNan);
            uh = u(rNan);
            SIG_OO = SIG (rNoNan,rNoNan);
            SIG_HO = SIG (rNan,rNoNan);
            r(rNan) = uh + SIG_HO*SIG_OO^(-1)*(r0-u0);
            R(:,i) = r;
        end
        
        C = zeros(n,n);
	  	% The minimization step (M)
        for i = 1:m
            r = R(:,i);
            C = C + (r-u)*(r-u)';
        end
        
        C = C / (m*(n-1)); % Here is the difference, n-1 is used here instead of n
        
        u = nanmean(R,2);
        % update mean value
        
        [U,D] = eigs(C,k);
        
        sigma_square = (trace(C)-trace(D))/(n-k);
        % updating sigma_square
        
        S = D- sigma_square;
        
        W = U*S;
        % updating W

	    % Compute the error
	    prevErr = rmse;
	    rmse = computeRMSE(R0,R);

	end

end
