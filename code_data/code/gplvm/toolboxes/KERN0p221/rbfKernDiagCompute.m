function k = rbfKernDiagCompute(kern, x)

% RBFKERNDIAGCOMPUTE Compute diagonal of RBF kernel.
%
%	Description:
%
%	K = RBFKERNDIAGCOMPUTE(KERN, X) computes the diagonal of the kernel
%	matrix for the radial basis function kernel given a design matrix of
%	inputs.
%	 Returns:
%	  K - a vector containing the diagonal of the kernel matrix computed
%	   at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - input data matrix in the form of a design matrix.
%	
%
%	See also
%	RBFKERNPARAMINIT, KERNDIAGCOMPUTE, KERNCREATE, RBFKERNCOMPUTE


%	Copyright (c) 2004, 2005, 2006 Neil D. Lawrence
% 	rbfKernDiagCompute.m CVS version 1.5
% 	rbfKernDiagCompute.m SVN version 1
% 	last update 2007-12-19T07:05:33.000000Z

k = repmat(kern.variance, size(x, 1), 1);
