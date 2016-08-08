function k = gaussianKernDiagCompute(kern, x)

% GAUSSIANKERNDIAGCOMPUTE Compute diagonal of gaussian kernel.
%
%	Description:
%
%	K = GAUSSIANKERNDIAGCOMPUTE(KERN, X) computes the diagonal of the
%	kernel matrix for the gaussian kernel given a design matrix of
%	inputs.
%	 Returns:
%	  K - a vector containing the diagonal of the kernel matrix computed
%	   at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - input data matrix in the form of a design matrix.
%	gaussianKernCompute
%	
%
%	See also
%	GAUSSIANKERNPARAMINIT, KERNDIAGCOMPUTE, KERNCREATE, 


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence
% 	gaussianKernDiagCompute.m SVN version 269
% 	last update 2009-03-04T09:27:52.000000Z
  
k = kern.sigma2_u*ones(size(x,1),1);