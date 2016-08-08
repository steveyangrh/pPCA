function g = rbfKernDiagGradient(kern, x, covDiag)

% RBFKERNDIAGGRADIENT Compute the gradient of the RBF kernel's diagonal wrt parameters.
%
%	Description:
%
%	G = RBFKERNDIAGGRADIENT(KERN, X, FACTORS) computes the gradient of
%	functions of the diagonal of the radial basis function kernel matrix
%	with respect to the parameters of the kernel. The parameters'
%	gradients are returned in the order given by the rbfKernExtractParam
%	command.
%	 Returns:
%	  G - gradients of the relevant function with respect to each of the
%	   parameters. Ordering should match the ordering given in
%	   rbfKernExtractParam.
%	 Arguments:
%	  KERN - the kernel structure for which the gradients are computed.
%	  X - the input data for which the gradient is being computed.
%	  FACTORS - partial derivatives of the function of interest with
%	   respect to the diagonal elements of the kernel.
%	
%
%	See also
%	RBFKERNPARAMINIT, KERNDIAGGRADIENT, RBFKERNEXTRACTPARAM, RBFKERNGRADIENT


%	Copyright (c) 2004, 2005, 2006 Neil D. Lawrence
% 	rbfKernDiagGradient.m CVS version 1.2
% 	rbfKernDiagGradient.m SVN version 1
% 	last update 2007-12-19T07:05:33.000000Z


g = zeros(1, kern.nParams);
g(1) = 0;
g(2) = sum(covDiag);
