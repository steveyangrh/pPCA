function [k, innerProd, arg, denom, numer, vec1, vec2] = mlpardKernCompute(kern, x, x2)

% MLPARDKERNCOMPUTE Compute the MLPARD kernel given the parameters and X.
%
%	Description:
%
%	K = MLPARDKERNCOMPUTE(KERN, X, X2) computes the kernel parameters
%	for the automatic relevance determination multi-layer perceptron
%	kernel given inputs associated with rows and columns.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - the input matrix associated with the rows of the kernel.
%	  X2 - the input matrix associated with the columns of the kernel.
%
%	K = MLPARDKERNCOMPUTE(KERN, X) computes the kernel matrix for the
%	automatic relevance determination multi-layer perceptron kernel
%	given a design matrix of inputs.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - input data matrix in the form of a design matrix.
%	
%
%	See also
%	MLPARDKERNPARAMINIT, KERNCOMPUTE, KERNCREATE, MLPARDKERNDIAGCOMPUTE


%	Copyright (c) 2004, 2005, 2006 Neil D. Lawrence
% 	mlpardKernCompute.m CVS version 1.5
% 	mlpardKernCompute.m SVN version 1
% 	last update 2007-12-19T07:05:33.000000Z


scales = sparse(diag(sqrt(kern.inputScales)));
x = x*scales;

if nargin < 3
  innerProd = x*x';
  numer = innerProd*kern.weightVariance + kern.biasVariance;
  vec1 = diag(numer) + 1;
  denom = sqrt(vec1*vec1');
  arg = numer./denom;
  k = kern.variance*asin(arg);
else
  x2 = x2*scales;
  innerProd = x*x2';  
  numer = innerProd*kern.weightVariance + kern.biasVariance;
  vec1 = sum(x.*x, 2)*kern.weightVariance + kern.biasVariance + 1;
  vec2 = sum(x2.*x2, 2)*kern.weightVariance + kern.biasVariance + 1;
  denom = sqrt(vec1*vec2');
  arg = numer./denom;
  k = kern.variance*asin(arg);
end
