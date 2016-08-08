function k = gaussianwhiteKernDiagCompute(kern, x)

% GAUSSIANWHITEKERNDIAGCOMPUTE Compute diagonal of gaussian white kernel.
%
%	Description:
%
%	K = GAUSSIANWHITEKERNDIAGCOMPUTE(KERN, X) computes the diagonal of
%	the kernel matrix for the gaussian white kernel given a design
%	matrix of inputs.
%	 Returns:
%	  K - a vector containing the diagonal of the kernel matrix computed
%	   at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - input data matrix in the form of a design matrix.
%	gaussianwhiteKernCompute
%	
%
%	See also
%	GAUSSIANWHITEKERNPARAMINIT, KERNDIAGCOMPUTE, KERNCREATE, 


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence
% 	gaussianwhiteKernDiagCompute.m SVN version 285
% 	last update 2009-03-04T20:53:50.000000Z
  
Pinv = 2./kern.precisionT;
factor = kern.sigma2Noise/((2*pi)^(kern.inputDimension/2)*sqrt(prod(Pinv))); 

k = factor*ones(size(x,1),1);