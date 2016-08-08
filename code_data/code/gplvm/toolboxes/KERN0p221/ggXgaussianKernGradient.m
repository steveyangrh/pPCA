function [g1, g2] = ggXgaussianKernGradient(ggKern, gaussianKern, x, x2, covGrad)

% GGXGAUSSIANKERNGRADIENT Compute gradient between the GG and GAUSSIAN kernels.
%
%	Description:
%
%	[G1, G2] = GGXGAUSSIANKERNGRADIENT(GGKERN, GAUSSIANKERN, X) computes
%	the gradient of an objective function with respect to cross kernel
%	terms between GG and GAUSSIAN kernels for the multiple output
%	kernel.
%	 Returns:
%	  G1 - gradient of objective function with respect to kernel
%	   parameters of GG kernel.
%	  G2 - gradient of objective function with respect to kernel
%	   parameters of GAUSSIAN kernel.
%	 Arguments:
%	  GGKERN - the kernel structure associated with the GG kernel.
%	  GAUSSIANKERN - the kernel structure associated with the GAUSSIAN
%	   kernel.
%	  X - inputs for which kernel is to be computed.
%
%	[G1, G2] = GGXGAUSSIANKERNGRADIENT(GGKERN, GAUSSIANKERN, X1, X2)
%	computes the gradient of an objective function with respect to cross
%	kernel terms between GG and GAUSSIAN kernels for the multiple output
%	kernel.
%	 Returns:
%	  G1 - gradient of objective function with respect to kernel
%	   parameters of GG kernel.
%	  G2 - gradient of objective function with respect to kernel
%	   parameters of GAUSSIAN kernel.
%	 Arguments:
%	  GGKERN - the kernel structure associated with the GG kernel.
%	  GAUSSIANKERN - the kernel structure associated with the GAUSSIAN
%	   kernel.
%	  X1 - row inputs for which kernel is to be computed.
%	  X2 - column inputs for which kernel is to be computed.
%	gaussianKernParamInit
%	
%
%	See also
%	MULTIKERNPARAMINIT, MULTIKERNCOMPUTE, GGKERNPARAMINIT, 


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence
% 	ggXgaussianKernGradient.m SVN version 1
% 	last update 2008-05-30T23:26:31.000000Z
 
if nargin < 5
    covGrad = x2;
    x2 = x;
end

[K, Linv, Ankinv, Bkinv] = ggXgaussianKernCompute(ggKern, gaussianKern, x, x2);
mu_n = ggKern.translation;
Pinv = Linv.^2;
x = x - repmat(mu_n',size(x,1),1); % Remove the mean first

matGradBk = zeros(ggKern.inputDimension,1);    
matGradAnk = zeros(ggKern.inputDimension,1);
gradMuN = zeros(ggKern.inputDimension,1);    
for i=1: ggKern.inputDimension,            
    X = repmat(x(:,i),1, size(x2,1));
    X2 = repmat(x2(:,i)',size(x,1),1);
    X_X2 = (X - X2).*(X - X2);    
    matGradBk(i) = sum(sum(0.5*covGrad.*K.*...
        (Bkinv(i)*Pinv(i)*Bkinv(i) - Bkinv(i) - Bkinv(i)*Pinv(i)*X_X2*Pinv(i)*Bkinv(i))));
    matGradAnk(i) = sum(sum(0.5*covGrad.*K.*...
        (Ankinv(i)*Pinv(i)*Ankinv(i) - Ankinv(i)*Pinv(i)*X_X2*Pinv(i)*Ankinv(i))));
    gradMuN(i) = sum(sum(covGrad.*K.*(Pinv(i)).*((X - X2))));
end

grad_sigma2_u = sum(sum(covGrad.*K))/gaussianKern.sigma2_u;
grad_sigma2_y = sum(sum(covGrad.*K))/ggKern.sigma2_y;

% only pass the gradient with respect to the inverse width to one
% of the gradient vectors ... otherwise it is counted twice.
g1 = [ matGradBk(:)' matGradAnk(:)' grad_sigma2_u grad_sigma2_y gradMuN'];
g2 = zeros(1,length(matGradBk)+1);

