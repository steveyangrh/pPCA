function k = simKernDiagCompute(kern, t)

% SIMKERNDIAGCOMPUTE Compute diagonal of SIM kernel.
%
%	Description:
%
%	K = SIMKERNDIAGCOMPUTE(KERN, T) computes the diagonal of the kernel
%	matrix for the single input motif kernel given a design matrix of
%	inputs.
%	 Returns:
%	  K - a vector containing the diagonal of the kernel matrix computed
%	   at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  T - input data matrix in the form of a design matrix.
%	
%	
%
%	See also
%	SIMKERNPARAMINIT, KERNDIAGCOMPUTE, KERNCREATE, SIMKERNCOMPUTE


%	Copyright (c) 2006 Neil D. Lawrence


%	With modifications by Antti Honkela 2008
% 	simKernDiagCompute.m CVS version 1.1
% 	simKernDiagCompute.m SVN version 104
% 	last update 2008-10-11T19:37:34.000000Z

if size(t, 2) > 1 
  error('Input can only have one column');
end

sigma = sqrt(2/kern.inverseWidth);
t = t - kern.delay;
halfSigmaD = 0.5*sigma*kern.decay;

lnPart1 = lnDiffErfs(halfSigmaD + t/sigma, halfSigmaD);
lnPart2 = lnDiffErfs(halfSigmaD, halfSigmaD - t/sigma);

h = exp(halfSigmaD*halfSigmaD + lnPart1)...
    - exp(halfSigmaD*halfSigmaD-(2*kern.decay*t) + lnPart2);

k = 2*h;
k = 0.5*k*sqrt(pi)*sigma;
k = kern.variance*k/(2*kern.decay);
