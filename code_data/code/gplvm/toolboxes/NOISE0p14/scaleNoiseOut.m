function y = scaleNoiseOut(noise, mu, varSigma)

% SCALENOISEOUT A simple noise model that scales and centres the data.
%
%	Description:
%	y = scaleNoiseOut(noise, mu, varSigma)
%

%	Copyright (c) 2007 Neil D. Lawrence
% 	scaleNoiseOut.m version 1.1


y = zeros(size(mu));
for i = 1:size(mu, 2)
  y(:, i) = noise.bias(i) + mu(:, i)*noise.scale(i);
end


