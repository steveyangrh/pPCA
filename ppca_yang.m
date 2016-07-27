%% ppca_yang: probabilistic PCA for player modeling
% R0 is the input matrix which contains missing values
% k is the number of basis

% E-M algorithm is employed here 

% Created on July 21, 2016
% Ronghao Yang
function [W,X] = ppca_yang(R0,k)

	[n,m] = size(R0);

	indexNotNan = find(~isnan(R0));
	% indexNotNan has the indices of all non-nan values

	W = rand(n,k);
	% initialize W with a random matrix

	minImprovement = 0.0001;
	rmse = 10^40;
	prevErr = Inf;
  	% specify the stop condition

	while(rmse < (1-minImprovement)*prevErr)
  	% the iterative step for minimizing the error

	  	% Expectation step (E)
	  	% generally, with missing values, minimize ||Wx*-y*||
	  	%X = inv(W'* W)*W'*R0;
	  	beta = W'*(W*W'+sigmaY^2.*eye());

	  	% The minimization step (M)
	  	%W = R0*X'*inv(X*X');

	    % Compute the error
	    prevErr = rmse;
	    %rmse = sqrt(mean(mean((R-W*H).^2)));

	end

end
