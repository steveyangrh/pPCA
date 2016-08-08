function [g1, g2] = simXrbfKernGradient(simKern, rbfKern, t1, t2, covGrad)

% SIMXRBFKERNGRADIENT Compute gradient between the SIM and RBF kernels.
%
%	Description:
%
%	[G1, G2] = SIMXRBFKERNGRADIENT(SIMKERN, RBFKERN, T) computes the
%	gradient of an objective function with respect to cross kernel terms
%	between SIM and RBF kernels for the multiple output kernel.
%	 Returns:
%	  G1 - gradient of objective function with respect to kernel
%	   parameters of SIM kernel.
%	  G2 - gradient of objective function with respect to kernel
%	   parameters of RBF kernel.
%	 Arguments:
%	  SIMKERN - the kernel structure associated with the SIM kernel.
%	  RBFKERN - the kernel structure associated with the RBF kernel.
%	  T - inputs for which kernel is to be computed.
%
%	[G1, G2] = SIMXRBFKERNGRADIENT(SIMKERN, RBFKERN, T1, T2) computes
%	the gradient of an objective function with respect to cross kernel
%	terms between SIM and RBF kernels for the multiple output kernel.
%	 Returns:
%	  G1 - gradient of objective function with respect to kernel
%	   parameters of SIM kernel.
%	  G2 - gradient of objective function with respect to kernel
%	   parameters of RBF kernel.
%	 Arguments:
%	  SIMKERN - the kernel structure associated with the SIM kernel.
%	  RBFKERN - the kernel structure associated with the RBF kernel.
%	  T1 - row inputs for which kernel is to be computed.
%	  T2 - column inputs for which kernel is to be computed.
%	
%	
%
%	See also
%	MULTIKERNPARAMINIT, MULTIKERNCOMPUTE, SIMKERNPARAMINIT, RBFKERNPARAMINIT


%	Copyright (c) 2006 Neil D. Lawrence


%	With modifications by Antti Honkela 2008, 2009
% 	simXrbfKernGradient.m CVS version 1.1
% 	simXrbfKernGradient.m SVN version 316
% 	last update 2009-03-04T19:25:40.000000Z

arg{1} = t1;
if nargin < 5
  covGrad = t2;
  t2 = t1;
else
  arg{2} = t2;  
end
if size(t1, 2) > 1 | size(t2, 2) > 1
  error('Input can only have one column');
end
if simKern.inverseWidth ~= rbfKern.inverseWidth
  error('Kernels cannot be cross combined if they have different inverse widths.')
end
% The SIM kernel implicitly assumes the variance of the RBF kernel
% for f(t) to be 1. To avoid confusion, the same constraint is
% enforced here as well.
if rbfKern.variance ~= 1
  error('SIM kernel can only be cross combined with an RBF kernel with variance 1.')
end

k = simXrbfKernCompute(simKern, rbfKern, arg{:});
dim1 = size(t1, 1);
dim2 = size(t2, 1);
t1Mat = t1(:, ones(1, dim2));
t2Mat = t2(:, ones(1, dim1))';
diffT = (t1Mat - t2Mat);
sigma = sqrt(2/simKern.inverseWidth);
sigma2 = sigma*sigma;
C_i = sqrt(simKern.variance);
D_i = simKern.decay;

part2 = exp(-t2Mat.*t2Mat/sigma2-t1Mat*D_i)...
        -exp(-diffT.*diffT/sigma2);

dk_dD = sum(sum((k.*(0.5*sigma2*D_i - diffT) ...
                 + 0.5*C_i*sigma2*part2).*covGrad));

dk_dsigma = sum(sum((k.*(1/sigma+0.5*sigma*D_i*D_i) ...
                     + C_i*sigma* ...
                     ((-diffT/sigma2-D_i/2).*exp(-diffT.*diffT/sigma2)...
                      +(-t2Mat/sigma2+D_i/2).*exp(-t2Mat.*t2Mat/sigma2-t1Mat*D_i))).*covGrad));

dk_dC = sum(sum(k.*covGrad))/C_i;
dk_dRbfVariance = 0;

dk_dinvWidth = -0.5*sqrt(2)/(simKern.inverseWidth* ...
                             sqrt(simKern.inverseWidth))*dk_dsigma;
dk_dSimVariance = dk_dC*0.5/C_i;


% only pass the gradient with respect to the inverse width to one
% of the gradient vectors ... otherwise it is counted twice.
g1 = [dk_dD dk_dinvWidth dk_dSimVariance];
g2 = [0 dk_dRbfVariance];


