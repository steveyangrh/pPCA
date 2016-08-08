function [m, beta] = ncnmNoiseSites(noise, g, nu, mu, varSigma, y)

% NCNMNOISESITES Site updates for null category model.
%
%	Description:
%	[m, beta] = ncnmNoiseSites(noise, g, nu, mu, varSigma, y)
%

%	Copyright (c) 2007 Neil D. Lawrence
% 	ncnmNoiseSites.m version 1.1


% The standard code.
beta = nu./(1-nu.*varSigma);
m = mu + g./nu;
