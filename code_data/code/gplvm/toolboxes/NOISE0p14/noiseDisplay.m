function noiseDisplay(noise, varargin)

% NOISEDISPLAY Display the parameters of the noise model.
%
%	Description:
%
%	NOISEDISPLAY(NOISE, SPACING) display the type of noise model and any
%	associated parameters.
%	 Arguments:
%	  NOISE - noise model to display.
%	  SPACING - any spacing to place before the noise model.
%	
%
%	See also
%	% SEEALSO MODELDISPLAY


%	Copyright (c) 2005 Neil D. Lawrence
% 	noiseDisplay.m version 1.6


fhandle = str2func([noise.type 'NoiseDisplay']);
fhandle(noise, varargin{:});