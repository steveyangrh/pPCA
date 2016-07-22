%% ppca_yang: probabilistic PCA for player modeling
% R0 is the input matrix which contains missing values
% k is the number of basis

% Created on July 21, 2016
% Ronghao Yang
function [W] = ppca_yang(R0,k)

	[n,m] = size(R0);

	W = rand(n,k);
	% initialize W with a random matrix

	u = rand; sigma = rand; % u and sigma maight be matrices
	% initialize u(mean), and sigma(standard deviation)

	minImprovement = 0.0001;
	rmse = 10^40;
	prevErr = Inf;

	while(rmse < (1-minImprovement)*prevErr)
	% the iterative step for minimizing the error

	% Expectation step (E)

	
	% The minimization step (M)


    % Compute the error



	end

end
