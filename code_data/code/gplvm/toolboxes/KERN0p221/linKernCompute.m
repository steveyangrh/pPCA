function k = linKernCompute(kern, x, x2)

% LINKERNCOMPUTE Compute the LIN kernel given the parameters and X.
%
%	Description:
%
%	K = LINKERNCOMPUTE(KERN, X, X2) computes the kernel parameters for
%	the linear kernel given inputs associated with rows and columns.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - the input matrix associated with the rows of the kernel.
%	  X2 - the input matrix associated with the columns of the kernel.
%
%	K = LINKERNCOMPUTE(KERN, X) computes the kernel matrix for the
%	linear kernel given a design matrix of inputs.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - input data matrix in the form of a design matrix.
%	
%
%	See also
%	LINKERNPARAMINIT, KERNCOMPUTE, KERNCREATE, LINKERNDIAGCOMPUTE


%	Copyright (c) 2004, 2005, 2006 Neil D. Lawrence
% 	linKernCompute.m CVS version 1.4
% 	linKernCompute.m SVN version 1
% 	last update 2007-12-19T07:05:34.000000Z


if nargin < 3
  k = x*x'*kern.variance;
else
  k = x*x2'*kern.variance;
end
if issparse(x)
  k = full(k);
end