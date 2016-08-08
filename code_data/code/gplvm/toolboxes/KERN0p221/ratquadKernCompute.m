function [k, n2] = ratquadKernCompute(kern, x, x2)

% RATQUADKERNCOMPUTE Compute the RATQUAD kernel given the parameters and X.
%
%	Description:
%
%	K = RATQUADKERNCOMPUTE(KERN, X, X2) computes the kernel parameters
%	for the rational quadratic kernel given inputs associated with rows
%	and columns.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - the input matrix associated with the rows of the kernel.
%	  X2 - the input matrix associated with the columns of the kernel.
%
%	K = RATQUADKERNCOMPUTE(KERN, X) computes the kernel matrix for the
%	rational quadratic kernel given a design matrix of inputs.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - input data matrix in the form of a design matrix.
%	
%
%	See also
%	RATQUADKERNPARAMINIT, KERNCOMPUTE, KERNCREATE, RATQUADKERNDIAGCOMPUTE


%	Copyright (c) 2006 Neil D. Lawrence
% 	ratquadKernCompute.m CVS version 1.1
% 	ratquadKernCompute.m SVN version 1
% 	last update 2007-12-19T07:05:33.000000Z

wi2 = .5/(kern.lengthScale*kern.lengthScale*kern.alpha);
if nargin < 3
  n2 = dist2(x, x);
else
  n2 = dist2(x, x2);
end
k = kern.variance*(1+n2*wi2).^-kern.alpha;
