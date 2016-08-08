function gX = ardKernDiagGradX(kern, X)

% ARDKERNDIAGGRADX Gradient of ARD kernel's diagonal with respect to X.
%
%	Description:
%
%	GX = ARDKERNDIAGGRADX(KERN, X) computes the gradient of the diagonal
%	of the pre-built RBF and linear ARD kernel matrix with respect to
%	the elements of the design matrix given in X.
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
%	ARDKERNPARAMINIT, KERNDIAGGRADX, ARDKERNGRADX


%	Copyright (c) 2004 Neil D. Lawrence
% 	ardKernDiagGradX.m CVS version 1.4
% 	ardKernDiagGradX.m SVN version 1
% 	last update 2007-12-19T07:05:35.000000Z


gX = 2*kern.linearVariance*X.*repmat(kern.inputScales, [size(X, 1) 1]);

