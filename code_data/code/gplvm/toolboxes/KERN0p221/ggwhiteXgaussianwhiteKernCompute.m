function [K, Pinv, Lrinv, Lqrinv] = ggwhiteXgaussianwhiteKernCompute(ggwhiteKern, ...
    gaussianwhiteKern, x, x2)

% GGWHITEXGAUSSIANWHITEKERNCOMPUTE Compute a cross kernel between the GG white and GAUSSIAN white kernels.
%
%	Description:
%
%	K = GGWHITEXGAUSSIANWHITEKERNCOMPUTE(GGKERN, GAUSSIANKERN, X)
%	computes cross kernel terms between GG white and GAUSSIAN white
%	kernels for the multiple output kernel.
%	 Returns:
%	  K - block of values from kernel matrix.
%	 Arguments:
%	  GGKERN - the kernel structure associated with the GG kernel.
%	  GAUSSIANKERN - the kernel structure associated with the GAUSSIAN
%	   kernel.
%	  X - inputs for which kernel is to be computed.
%
%	K = GGWHITEXGAUSSIANWHITEKERNCOMPUTE(GGWHITEKERN, KERNEL., X, X2)
%	computes cross kernel terms between GG white and GAUSSIAN white
%	kernels for the multiple output kernel.
%	 Returns:
%	  K - block of values from kernel matrix.
%	 Arguments:
%	  GGWHITEKERN - the kernel structure associated with the GG kernel.
%	  KERNEL. - % ARG gaussianwhiteKern the kernel structure associated
%	   with the GAUSSIAN kernel.
%	  X - row inputs for which kernel is to be computed.
%	  X2 - column inputs for which kernel is to be computed.
%	gaussianwhiteKernParamInit
%	
%	
%
%	See also
%	MULTIKERNPARAMINIT, MULTIKERNCOMPUTE, GGWHITEKERNPARAMINIT, 


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence
% 	ggwhiteXgaussianwhiteKernCompute.m SVN version 285
% 	last update 2009-03-04T20:53:52.000000Z
  
if nargin < 4
  x2 = x;
end

Lqr = ggwhiteKern.precisionG;
Lr  = gaussianwhiteKern.precisionT; 
Lqrinv = 1./Lqr;
Lrinv = 1./Lr;
Pinv = Lqrinv + Lrinv;
P = 1./Pinv;
detPinv = prod(Pinv);
sqrtP = sqrt(P);
sqrtPx = x*sparseDiag(sqrtP);
sqrtPx2 = x2*sparseDiag(sqrtP);
n2 = dist2(sqrtPx, sqrtPx2);
factor = ggwhiteKern.variance*gaussianwhiteKern.sigma2Noise...
    /((2*pi)^(ggwhiteKern.inputDimension/2)*sqrt(detPinv)); 
K = factor*exp(-0.5*n2);
