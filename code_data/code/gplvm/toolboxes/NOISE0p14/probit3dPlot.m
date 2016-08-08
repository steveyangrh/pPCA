function probit3dPlot(noise, plotType, CX, CY, CZ, CZVar, varargin)

% PROBIT3DPLOT Draw a 3D or contour plot for the probit.
%
%	Description:
%	probit3dPlot(noise, plotType, CX, CY, CZ, CZVar, varargin)
%

%	Copyright (c) 2007 Neil D. Lawrence
% 	probit3dPlot.m version 1.3


CZ = CZ + model.noise.bias;
fhandle = str2func(plotType);
fhandle(CX, CY, CZ, varargin{:});

