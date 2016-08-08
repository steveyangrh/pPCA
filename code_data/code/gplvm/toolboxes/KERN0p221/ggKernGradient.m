function g = ggKernGradient(kern, x, varargin)

% GGKERNGRADIENT Gradient of GG kernel's parameters.
%
%	Description:
%
%	G = GGKERNGRADIENT(KERN, X, PARTIAL) computes the gradient of
%	functions with respect to the gaussian gaussian kernel's parameters.
%	As well as the kernel structure and the input positions, the user
%	provides a matrix PARTIAL which gives the partial derivatives of the
%	function with respect to the relevant elements of the kernel matrix.
%	 Returns:
%	  G - gradients of the function of interest with respect to the
%	   kernel parameters. The ordering of the vector should match that
%	   provided by the function kernExtractParam.
%	 Arguments:
%	  KERN - the kernel structure for which the gradients are being
%	   computed.
%	  X - the input locations for which the gradients are being
%	   computed.
%	  PARTIAL - matrix of partial derivatives of the function of
%	   interest with respect to the kernel matrix. The argument takes the
%	   form of a square matrix of dimension  numData, where numData is
%	   the number of rows in X.
%
%	G = GGKERNGRADIENT(KERN, X1, X2, PARTIAL) computes the derivatives
%	as above, but input locations are now provided in two matrices
%	associated with rows and columns of the kernel matrix.
%	 Returns:
%	  G - gradients of the function of interest with respect to the
%	   kernel parameters.
%	 Arguments:
%	  KERN - the kernel structure for which the gradients are being
%	   computed.
%	  X1 - the input locations associated with the rows of the kernel
%	   matrix.
%	  X2 - the input locations associated with the columns of the kernel
%	   matrix.
%	  PARTIAL - matrix of partial derivatives of the function of
%	   interest with respect to the kernel matrix. The matrix should have
%	   the same number of rows as X1 and the same number of columns as X2
%	   has rows.
%	
%
%	See also
%	GGKERNPARAMINIT, KERNGRADIENT, GGKERNDIAGGRADIENT, KERNGRADX


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence
% 	ggKernGradient.m SVN version 1
% 	last update 2008-05-30T23:26:31.000000Z



% if length(varargin)<2
%   x2 = x;
% else
%   x2 = varargin{1};
% end

[g1, g2] = ggXggKernGradient(kern, kern, x, varargin{end});

g = g1 + g2;
