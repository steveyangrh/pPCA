function [g1, g2] = ggwhiteXgaussianwhiteKernGradient(ggwhiteKern, gaussianwhiteKern,...
    x, x2, covGrad)

% GGWHITEXGAUSSIANWHITEKERNGRADIENT Compute gradient between the GG white
%
%	Description:
%	and GAUSSIAN white kernels.
%
%	[G1, G2] = GGWHITEXGAUSSIANWHITEKERNGRADIENT(GGWHITEKERN,
%	GAUSSIANWHITEKERN, X) computes the gradient of an objective function
%	with respect to cross kernel terms between GG white and GAUSSIAN
%	white kernels for the multiple output kernel.
%	 Returns:
%	  G1 - gradient of objective function with respect to kernel
%	   parameters of GG white kernel.
%	  G2 - gradient of objective function with respect to kernel
%	   parameters of GAUSSIAN white kernel.
%	 Arguments:
%	  GGWHITEKERN - the kernel structure associated with the GG white
%	   kernel.
%	  GAUSSIANWHITEKERN - the kernel structure associated with the
%	   GAUSSIAN white kernel.
%	  X - inputs for which kernel is to be computed.
%
%	[G1, G2] = GGWHITEXGAUSSIANWHITEKERNGRADIENT(GGWHITEKERN,
%	GAUSSIANWHITEKERN, X1, X2) computes the gradient of an objective
%	function with respect to cross kernel terms between GG white and
%	GAUSSIAN white kernels for the multiple output kernel.
%	 Returns:
%	  G1 - gradient of objective function with respect to kernel
%	   parameters of GG white kernel.
%	  G2 - gradient of objective function with respect to kernel
%	   parameters of GAUSSIAN white kernel.
%	 Arguments:
%	  GGWHITEKERN - the kernel structure associated with the GG white
%	   kernel.
%	  GAUSSIANWHITEKERN - the kernel structure associated with the
%	   GAUSSIAN white kernel.
%	  X1 - row inputs for which kernel is to be computed.
%	  X2 - column inputs for which kernel is to be computed.
%	gaussianwhiteKernParamInit
%	
%
%	See also
%	MULTIKERNPARAMINIT, MULTIKERNCOMPUTE, GGWHITEKERNPARAMINIT, 


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence
% 	ggwhiteXgaussianwhiteKernGradient.m SVN version 285
% 	last update 2009-03-04T20:53:52.000000Z
 
if nargin < 5
    covGrad = x2;
    x2 = x;
end

[K, Pinv, Lrinv, Lqrinv] = ggwhiteXgaussianwhiteKernCompute(ggwhiteKern, ...
    gaussianwhiteKern, x, x2);

P = 1./Pinv;

matGradLr = zeros(ggwhiteKern.inputDimension,1);    
matGradLqr = zeros(ggwhiteKern.inputDimension,1);

for i=1: ggwhiteKern.inputDimension,            
    X = repmat(x(:,i),1, size(x2,1));
    X2 = repmat(x2(:,i)',size(x,1),1);
    X_X2 = (X - X2).*(X - X2);    
    matGradLr(i) = sum(sum(0.5*covGrad.*K.*...
        (Lrinv(i)*P(i)*Lrinv(i) - Lrinv(i)*P(i)*X_X2*P(i)*Lrinv(i))));
    matGradLqr(i) = sum(sum(0.5*covGrad.*K.*...
        (Lqrinv(i)*P(i)*Lqrinv(i) - Lqrinv(i)*P(i)*X_X2*P(i)*Lqrinv(i))));
end

grad_sigma2Noise = sum(sum(covGrad.*K))/gaussianwhiteKern.sigma2Noise;
grad_variance    = sum(sum(covGrad.*K))/ggwhiteKern.variance;

% only pass the gradient with respect to the inverse width to one
% of the gradient vectors ... otherwise it is counted twice.
g1 = [matGradLqr(:)' 0 grad_variance];
g2 = [matGradLr(:)' grad_sigma2Noise];

