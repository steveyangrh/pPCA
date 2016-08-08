function gX = simKernDiagGradX(kern, X)

% SIMKERNDIAGGRADX Gradient of SIM kernel's diagonal with respect to X.
%
%	Description:
%
%	GX = SIMKERNDIAGGRADX(KERN, X) computes the gradient of the diagonal
%	of the single input motif kernel matrix with respect to the elements
%	of the design matrix given in X.
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
%	SIMKERNPARAMINIT, KERNDIAGGRADX, SIMKERNGRADX


%	Copyright (c) 2006 Neil D. Lawrence
% 	simKernDiagGradX.m CVS version 1.1
% 	simKernDiagGradX.m SVN version 1
% 	last update 2007-12-19T07:05:33.000000Z

error('simKernDiagGradX not yet implemented.');