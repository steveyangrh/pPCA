function g = noiseGradX(noise, mu, varsigma, dmu, dvs, y);

% NOISEGRADX Returns the gradient of the log-likelihood wrt x.
%
%	Description:
%	g = noiseGradX(noise, mu, varsigma, dmu, dvs, y);
%

%	Copyright (c) 2007 Neil D. Lawrence
% 	noiseGradX.m version 1.3


[dlnZ_dmu, dlnZ_dvs] = noiseGradVals(noise, mu, varsigma, y);
g = dlnZ_dmu*dmu' + dlnZ_dvs*dvs';
