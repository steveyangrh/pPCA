function noise = scaleNoiseExpandParam(noise, params)

% SCALENOISEEXPANDPARAM Expand Scale noise structure from param vector.
%
%	Description:
%	noise = scaleNoiseExpandParam(noise, params)
%

%	Copyright (c) 2007 Neil D. Lawrence
% 	scaleNoiseExpandParam.m version 1.1


noise.bias = params(1:noise.numProcess);
noise.scale = params(noise.numProcess+1:end);