function g = negNoiseGradientParam(params, model, prior)

% NEGNOISEGRADIENTPARAM Wrapper function for calling noise gradients.
%
%	Description:
%	g = negNoiseGradientParam(params, model, prior)
%

%	Copyright (c) 2007 Neil D. Lawrence
% 	negNoiseGradientParam.m version 1.3


model.noise = noiseExpandParam(model.noise, params);
fhandle = str2func([model.noise.type 'GradientParam']);
g = - fhandle(model);

if prior
  g = g + params;
end