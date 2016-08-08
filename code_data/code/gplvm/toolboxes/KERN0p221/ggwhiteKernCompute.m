function k = ggwhiteKernCompute(kern, x, x2)

% GGWHITEKERNCOMPUTE Compute the GG white kernel given the parameters and X.
%
%	Description:
%
%	K = GGWHITEKERNCOMPUTE(KERN, X, KERNEL.) computes the kernel
%	parameters for the gaussian white gaussian white kernel given inputs
%	associated with rows and columns.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - the input matrix associated with the rows of the kernel.
%	  KERNEL. - % ARG x2 the input matrix associated with the columns of
%	   the kernel.
%
%	K = GGWHITEKERNCOMPUTE(KERN, X) computes the kernel matrix for the
%	gaussian white kernel given a design matrix of inputs. Returns:
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - input data matrix in the form of a design matrix.
%	
%
%	See also
%	GGWHITEKERNPARAMINIT, KERNCOMPUTE, KERNCREATE, GGWHITEKERNDIAGCOMPUTE


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence
% 	ggwhiteKernCompute.m SVN version 285
% 	last update 2009-03-04T20:53:50.000000Z


if nargin < 3
  x2 = x;
end

k = ggwhiteXggwhiteKernCompute(kern, kern, x, x2);
