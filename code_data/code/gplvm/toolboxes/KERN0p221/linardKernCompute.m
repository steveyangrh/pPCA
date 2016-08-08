function k = linardKernCompute(kern, x, x2)

% LINARDKERNCOMPUTE Compute the LINARD kernel given the parameters and X.
%
%	Description:
%
%	K = LINARDKERNCOMPUTE(KERN, X, X2) computes the kernel parameters
%	for the automatic relevance determination linear kernel given inputs
%	associated with rows and columns.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - the input matrix associated with the rows of the kernel.
%	  X2 - the input matrix associated with the columns of the kernel.
%
%	K = LINARDKERNCOMPUTE(KERN, X) computes the kernel matrix for the
%	automatic relevance determination linear kernel given a design
%	matrix of inputs.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - input data matrix in the form of a design matrix.
%	
%
%	See also
%	LINARDKERNPARAMINIT, KERNCOMPUTE, KERNCREATE, LINARDKERNDIAGCOMPUTE


%	Copyright (c) 2004, 2005, 2006 Neil D. Lawrence
% 	linardKernCompute.m CVS version 1.4
% 	linardKernCompute.m SVN version 1
% 	last update 2007-12-19T07:05:34.000000Z


scales = sparse(diag(sqrt(kern.inputScales)));
x = x*scales;
    
if nargin < 3
  k = x*x'*kern.variance;
else
  x2 = x2*scales;
  k = x*x2'*kern.variance;
end
