function K = matern52KernCompute(kern, x, x2)

% MATERN52KERNCOMPUTE Compute the MATERN52 kernel given the parameters and X.
%
%	Description:
%
%	K = MATERN52KERNCOMPUTE(KERN, X, X2) computes the kernel parameters
%	for the matern kernel with nu=5/2 kernel given inputs associated
%	with rows and columns.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - the input matrix associated with the rows of the kernel.
%	  X2 - the input matrix associated with the columns of the kernel.
%
%	K = MATERN52KERNCOMPUTE(KERN, X) computes the kernel matrix for the
%	matern kernel with nu=5/2 kernel given a design matrix of inputs.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - input data matrix in the form of a design matrix.
%	
%
%	See also
%	MATERN52KERNPARAMINIT, KERNCOMPUTE, KERNCREATE, MATERN52KERNDIAGCOMPUTE


%	Copyright (c) 2006 Neil D. Lawrence
% 	matern52KernCompute.m CVS version 1.1
% 	matern52KernCompute.m SVN version 1
% 	last update 2007-12-19T07:05:33.000000Z

if nargin < 3
  n2 = dist2(x, x);
else
  n2 = dist2(x, x2);
end
wi2 = (5/(kern.lengthScale*kern.lengthScale));
n2wi2 = n2*wi2;
sqrtn2wi2 = sqrt(n2wi2);
K = kern.variance*(1+sqrtn2wi2+n2wi2/3).*exp(-sqrtn2wi2);
