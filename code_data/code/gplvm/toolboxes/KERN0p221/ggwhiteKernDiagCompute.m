function k = ggwhiteKernDiagCompute(kern, x)

% GGWHITEKERNDIAGCOMPUTE Compute diagonal of GG WHITE kernel.
%
%	Description:
%
%	K = GGWHITEKERNDIAGCOMPUTE(KERN) computes the diagonal of the kernel
%	matrix for the gaussian gaussian white kernel given a design matrix
%	of inputs.
%	 Returns:
%	  K - a vector containing the diagonal of the kernel matrix computed
%	   at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed. X :
%	   input data matrix in the form of a design matrix.
%	
%
%	See also
%	GGWHITEKERNPARAMINIT, KERNDIAGCOMPUTE, KERNCREATE, GGWHITEKERNCOMPUTE


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence
% 	ggwhiteKernDiagCompute.m SVN version 285
% 	last update 2009-03-04T20:53:50.000000Z

Pinv = 2./kern.precisionG;
factor = kern.sigma2Noise*kern.variance^2/((2*pi)^(kern.inputDimension/2)*sqrt(prod(Pinv))); 

k = factor*ones(length(x),1);