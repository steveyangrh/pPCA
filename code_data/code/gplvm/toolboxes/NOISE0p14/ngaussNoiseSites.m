function [m, beta] = ngaussNoiseSites(noise, g, nu, mu, varSigma, y)

% NGAUSSNOISESITES Site updates for noiseless Gaussian noise model.
%
%	Description:
%	[m, beta] = ngaussNoiseSites(noise, g, nu, mu, varSigma, y)
%

%	Copyright (c) 2007 Neil D. Lawrence
% 	ngaussNoiseSites.m version 1.2




[m, beta] = gaussianNoiseSites(noise, g, nu, mu, varSigma, y);