function gX = sqexpKernDiagGradX(kern, x)

% SQEXPKERNDIAGGRADX Gradient of SQEXP kernel's diagonal with respect to X.
%
%	Description:
%
%	GX = SQEXPKERNDIAGGRADX(KERN, X) computes the gradient of the
%	diagonal of the pre-built compound squared exponential kernel matrix
%	with respect to the elements of the design matrix given in X.
%	 Returns:
%	  GX - the gradients of the diagonal with respect to each element of
%	   X. The returned matrix has the same dimensions as X.
%	 Arguments:
%	  KERN - the kernel structure for which gradients are being
%	   computed.
%	  X - the input data in the form of a design matrix.
%	
%
%	See also
%	SQEXPKERNPARAMINIT, KERNDIAGGRADX, SQEXPKERNGRADX


%	Copyright (c) 2004 Neil D. Lawrence
% 	sqexpKernDiagGradX.m CVS version 1.4
% 	sqexpKernDiagGradX.m SVN version 1
% 	last update 2007-12-19T07:05:33.000000Z


gX = zeros(size(x));
