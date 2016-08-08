function [nu, g] = orderedNoiseUpdateParams(noise, mu, varsigma, y, index)

% ORDEREDNOISEUPDATEPARAMS Update parameters for ordered categorical noise model.
%
%	Description:
%	[nu, g] = orderedNoiseUpdateParams(noise, mu, varsigma, y, index)
%

%	Copyright (c) 2007 Neil D. Lawrence
% 	orderedNoiseUpdateParams.m version 1.2




[g, dlnZ_dvs] = orderedNoiseGradVals(noise, mu(index, :), ...
                                            varsigma(index, :), ...
                                            y(index, :));

nu = g.*g - 2*dlnZ_dvs;