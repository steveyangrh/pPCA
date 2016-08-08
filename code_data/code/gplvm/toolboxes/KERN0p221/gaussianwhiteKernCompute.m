function [K, Pinv]  = gaussianwhiteKernCompute(kern, x, x2)

% GAUSSIANWHITEKERNCOMPUTE Compute the covariance of the output samples
%
%	Description:
%	when the input is a white noise process and the smoothing kernel is a
%	Gaussian kernel.
%
%	K = GAUSSIANWHITEKERNCOMPUTE(KERN, X, X2) computes the kernel
%	parameters for the Gaussian white kernel given inputs associated
%	with rows and columns.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - the input matrix associated with the rows of the kernel.
%	  X2 - the input matrix associated with the columns of the kernel.
%
%	K = GAUSSIANWHITEKERNCOMPUTE(KERN, X) computes the kernel matrix for
%	the Gaussian white kernel given a design matrix of inputs.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - input data matrix in the form of a design matrix.
%	
%
%	See also
%	GAUSSIANWHITEKERNPARAMINIT, KERNCOMPUTE, KERNCREATE, GAUSSIANWHITEKERNDIAGCOMPUTE


%	Copyright (c) 2008 Mauricio Alvarez and Neil D. Lawrence
% 	gaussianwhiteKernCompute.m SVN version 285
% 	last update 2009-03-04T20:53:50.000000Z

sqrtP = sqrt(kern.precisionT/2);
Pinv = 2./kern.precisionT;
Px = x*sparseDiag(sqrtP);

if nargin < 3  
  n2 = dist2(Px, Px);
  factor = kern.sigma2Noise/((2*pi)^(kern.inputDimension/2)*sqrt(prod(Pinv))); 
  K = factor*exp(-0.5*n2);
else
  Px2 = x2*sparseDiag(sqrtP);
  n2 = dist2(Px, Px2);
  factor = kern.sigma2Noise/((2*pi)^(kern.inputDimension/2)*sqrt(prod(Pinv))); 
  K = factor*exp(-0.5*n2);
end










