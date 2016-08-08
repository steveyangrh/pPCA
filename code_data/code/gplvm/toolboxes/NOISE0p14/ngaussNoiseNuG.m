function [g, nu] = ngaussNoiseNuG(noise, mu, varSigma, y)

% NGAUSSNOISENUG Update nu and g parameters associated with noiseless Gaussian noise model.
%
%	Description:
%	[g, nu] = ngaussNoiseNuG(noise, mu, varSigma, y)
%

%	Copyright (c) 2007 Neil D. Lawrence
% 	ngaussNoiseNuG.m version 1.2




[g, nu] = gaussianNoiseNuG(noise, mu, varSigma, y);
