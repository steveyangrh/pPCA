function [K, L]  = gaussianKernCompute(kern, x, x2)

% GAUSSIANKERNCOMPUTE Compute the Gaussian kernel given the parameters and X.
%
%	Description:
%
%	K = GAUSSIANKERNCOMPUTE(KERN, X, X2) computes the kernel parameters
%	for the Gaussian kernel given inputs associated with rows and
%	columns.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - the input matrix associated with the rows of the kernel.
%	  X2 - the input matrix associated with the columns of the kernel.
%
%	K = GAUSSIANKERNCOMPUTE(KERN, X) computes the kernel matrix for the
%	Gaussian kernel given a design matrix of inputs.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - input data matrix in the form of a design matrix.
%	
%
%	See also
%	GAUSSIANKERNPARAMINIT, KERNCOMPUTE, KERNCREATE, GAUSSIANKERNDIAGCOMPUTE


%	Copyright (c) 2008 Mauricio Alvarez and Neil D. Lawrence
% 	gaussianKernCompute.m SVN version 1
% 	last update 2008-05-30T23:26:31.000000Z

L = sqrt(kern.precision_u);
Lx = x*diag(L);

if nargin < 3  
  n2 = dist2(Lx, Lx);
  K = kern.sigma2_u*exp(-0.5*n2);
else
  Lx2 = x2*diag(L);
  n2 = dist2(Lx, Lx2);
  K = kern.sigma2_u*exp(-0.5*n2);
end










