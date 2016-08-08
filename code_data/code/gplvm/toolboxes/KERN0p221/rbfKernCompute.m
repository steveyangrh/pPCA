function [k, n2] = rbfKernCompute(kern, x, x2)

% RBFKERNCOMPUTE Compute the RBF kernel given the parameters and X.
%
%	Description:
%
%	K = RBFKERNCOMPUTE(KERN, X, X2) computes the kernel parameters for
%	the radial basis function kernel given inputs associated with rows
%	and columns.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - the input matrix associated with the rows of the kernel.
%	  X2 - the input matrix associated with the columns of the kernel.
%
%	K = RBFKERNCOMPUTE(KERN, X) computes the kernel matrix for the
%	radial basis function kernel given a design matrix of inputs.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - input data matrix in the form of a design matrix.
%	
%
%	See also
%	RBFKERNPARAMINIT, KERNCOMPUTE, KERNCREATE, RBFKERNDIAGCOMPUTE


%	Copyright (c) 2004, 2005, 2006 Neil D. Lawrence
% 	rbfKernCompute.m CVS version 1.7
% 	rbfKernCompute.m SVN version 1
% 	last update 2009-03-04T21:34:32.000000Z

if nargin < 3
  n2 = dist2(x, x);
  wi2 = (.5 .* kern.inverseWidth);
  k = kern.variance*exp(-n2*wi2);
else
  n2 = dist2(x, x2);
  wi2 = (.5 .* kern.inverseWidth);
  k = kern.variance*exp(-n2*wi2);
end
