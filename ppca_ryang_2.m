%% ppca_yang_2: probabilistic PCA for player modeling
% R0 is the input matrix which contains missing values
% k is the number of basis

% E-M algorithm is employed here

% Created on August 5, 2016
% Ronghao Yang
function [W,u,sigma_square,R] = ppca_ryang_2(R0,k)

    [n,m] = size(R0);

    indexNotNan = find(~isnan(R0));

    W = rand(n,k); % initialize W with a random matrix

    u = nanmean(R0,2); % initialize u
    u = repmat(u,1,m);

    sigma_square = rand; % initialize sigma_square

    minImprovement = 0.00001;
  	rmse = 10^40;
  	prevErr = Inf;
    % specify the stop condition

    R = rand(n,m);
    R(indexNotNan) = R0 (indexNotNan);

    while(rmse < (1-minImprovement)*prevErr)

      % -----------------------------------------------
      % E step
      beta = W'*inv(W*W'+sigma_square*eye(n,n));
      X = beta * (R - u);
      SIG = n*eye(k,k)-n*beta*W-X*X';

      % ----------------------------------------------
      % M step
      W = (R-u)*X'*inv(SIG);
      sigma_square = trace(X*X'-W*X*(R-u)')./(n^2);
      R = W*X+u; %+sigma_square*eye()
      R(indexNotNan) = R0(indexNotNan);
      u = nanmean(R,2); % initialize u
      u = repmat(u,1,m);


      % Compute the error
      prevErr = rmse;
      rmse = computeRMSE(R0,R);

    end

end
