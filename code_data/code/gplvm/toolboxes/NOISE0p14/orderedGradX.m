function g = orderedGradX(X, Y, model, prior)

% ORDEREDGRADX Gradient wrt x of log-likelihood for Ordered categorical model.
%
%	Description:
%	g = orderedGradX(X, Y, model, prior)
%

%	Copyright (c) 2007 Neil D. Lawrence
% 	orderedGradX.m version 1.2




if size(X, 1) > 1
  error('This function only takes one data-point');
end