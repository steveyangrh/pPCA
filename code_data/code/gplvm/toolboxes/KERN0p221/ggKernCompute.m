function k = ggKernCompute(kern, x, x2)

% GGKERNCOMPUTE Compute the GG kernel given the parameters and X.
%
%	Description:
%
%	K = GGKERNCOMPUTE(KERN, X, KERNEL.) computes the kernel parameters
%	for the gaussian gaussian kernel given inputs associated with rows
%	and columns.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - the input matrix associated with the rows of the kernel.
%	  KERNEL. - % ARG x2 the input matrix associated with the columns of
%	   the kernel.
%
%	K = GGKERNCOMPUTE(KERN, X) computes the kernel matrix for the
%	gaussian kernel given a design matrix of inputs. Returns:
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - input data matrix in the form of a design matrix.
%	
%
%	See also
%	GGKERNPARAMINIT, KERNCOMPUTE, KERNCREATE, GGKERNDIAGCOMPUTE


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence
% 	ggKernCompute.m SVN version 1
% 	last update 2008-05-30T23:26:31.000000Z


if nargin < 3
  x2 = x;
end

k = ggXggKernCompute(kern, kern, x, x2);
