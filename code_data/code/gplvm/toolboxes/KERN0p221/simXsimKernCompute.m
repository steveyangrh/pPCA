function K = simXsimKernCompute(simKern1, simKern2, t1, t2)

% SIMXSIMKERNCOMPUTE Compute a cross kernel between two SIM kernels.
%
%	Description:
%
%	K = SIMXSIMKERNCOMPUTE(SIMKERN1, SIMKERN2, T) computes cross kernel
%	terms between two SIM kernels for the multiple output kernel.
%	 Returns:
%	  K - block of values from kernel matrix.
%	 Arguments:
%	  SIMKERN1 - the kernel structure associated with the first SIM
%	   kernel.
%	  SIMKERN2 - the kernel structure associated with the second SIM
%	   kernel.
%	  T - inputs for which kernel is to be computed.
%
%	K = SIMXSIMKERNCOMPUTE(SIMKERN1, SIMKERN2, T1, T2) computes cross
%	kernel terms between two SIM kernels for the multiple output kernel.
%	 Returns:
%	  K - block of values from kernel matrix.
%	 Arguments:
%	  SIMKERN1 - the kernel structure associated with the first SIM
%	   kernel.
%	  SIMKERN2 - the kernel structure associated with the second SIM
%	   kernel.
%	  T1 - row inputs for which kernel is to be computed.
%	  T2 - column inputs for which kernel is to be computed.
%	
%
%	See also
%	MULTIKERNPARAMINIT, MULTIKERNCOMPUTE, SIMKERNPARAMINIT


%	Copyright (c) 2006 Neil D. Lawrence
% 	simXsimKernCompute.m CVS version 1.2
% 	simXsimKernCompute.m SVN version 1
% 	last update 2008-04-07T14:07:11.000000Z

if nargin < 4
  t2 = t1;
end
if size(t1, 2) > 1 | size(t2, 2) > 1
  error('Input can only have one column');
end
if simKern1.inverseWidth ~= simKern2.inverseWidth
  error('Kernels cannot be cross combined if they have different inverse widths.')
end

% The factor of 2 on the top is because all our derivations are in terms
% of erfs which are defined in terms of exp(-x^2) rather than exp(-0.5x^2).
sigma = sqrt(2/simKern1.inverseWidth);

h1 = simComputeH(t1, t2, simKern1.decay, simKern2.decay, simKern1.delay, simKern2.delay, sigma);
h2 = simComputeH(t2, t1, simKern2.decay, simKern1.decay, simKern2.delay, simKern1.delay, sigma);
K = h1 + h2';
K = 0.5*K*sqrt(pi)*sigma;
K = sqrt(simKern1.variance)*sqrt(simKern2.variance)*K;
