function gX = matern32KernDiagGradX(kern, X)

% MATERN32KERNDIAGGRADX Gradient of MATERN32 kernel's diagonal with respect to X.
%
%	Description:
%
%	GX = MATERN32KERNDIAGGRADX(KERN, X) computes the gradient of the
%	diagonal of the matern kernel with nu=3/2 kernel matrix with respect
%	to the elements of the design matrix given in X.
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
%	MATERN32KERNPARAMINIT, KERNDIAGGRADX, MATERN32KERNGRADX


%	Copyright (c) 2006 Neil D. Lawrence
% 	matern32KernDiagGradX.m CVS version 1.1
% 	matern32KernDiagGradX.m SVN version 1
% 	last update 2007-12-19T07:05:33.000000Z

gX = zeros(size(X));
