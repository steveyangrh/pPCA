function [X, sigma2] = ppcaEmbed(Y, dims)

% PPCAEMBED Embed data set with probabilistic PCA.
%
%	Description:
%
%	[X, SIGMA2] = PPCAEMBED(Y, DIMS) returns latent positions for a
%	given data set via probabilistic PCA.
%	 Returns:
%	  X - the latent positions.
%	  SIGMA2 - the variance not explained by the latent positions.
%	 Arguments:
%	  Y - the data set which you want the latent positions for.
%	  DIMS - the dimensionality of the latent space.
%	
%
%	See also
%	LLEEMBED, ISOMAPEMBED


%	Copyright (c) 2006 Neil D. Lawrence
% 	ppcaEmbed.m CVS version 1.4
% 	ppcaEmbed.m SVN version 24
% 	last update 2009-01-08T20:55:14.000000Z

if ~any(any(isnan(Y)))
  [v, u] = pca(Y);
  v(find(v<0))=0;
  Ymean = mean(Y);
  Ycentre = zeros(size(Y));
  for i = 1:size(Y, 2);
    Ycentre(:, i) = Y(:, i) - Ymean(i);
  end
  X = Ycentre*u(:, 1:dims)*diag(1./sqrt(v(1:dims)));
  sigma2 = mean(v(dims+1:end));
else
  % Hacky implementation of Probabilistic PCA for when there is missing data.
  iters = 100;
  % Initialise W randomly
  d = size(Y, 2);
  q = dims;
  N = size(Y, 1);
  W = randn(d, q)*1e-3;
  sigma2 = 1;
  mu = zeros(d, 1);
  for i = 1:d
    obs = find(~isnan(Y(:, i)));
    if length(obs)>0
      mu(i) = mean(Y(obs, i));
    else
      mu(i) = 0;
    end
  end
  numObs = sum(sum(~isnan(Y)));
  for i = 1:iters
    M = W'*W + sigma2*eye(q);
    invM = inv(M);
    exp_xxT = zeros(q);
    exp_x = zeros(N, q);
    for n = 1:N
      obs = find(~isnan(Y(n, :)));
      exp_x(n, :) = (invM*W(obs, :)'*(Y(n, obs)' - mu(obs)))';
    end
    exp_xxT = N*sigma2*invM + exp_x'*exp_x;
    s = zeros(d, q);
    s2 = 0;
    for n = 1:N
      obs = find(~isnan(Y(n, :)));
      subY = zeros(size(Y(n, :)))';
      subY(obs) = Y(n, obs)' - mu(obs);
      s = s + (subY)*exp_x(n, :);
      s2 = s2 + sum((Y(n, obs)' - mu(obs)).^2) - 2*exp_x(n, :)*W(obs, :)'*(Y(n, obs)' - mu(obs));
    end
    W = s*inv(exp_xxT);
    sigma2 = 1/(numObs)*(s2 + trace(exp_xxT*W'*W));
  end
  
  X = exp_x;
end