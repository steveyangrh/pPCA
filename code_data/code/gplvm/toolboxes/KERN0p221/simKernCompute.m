function k = simKernCompute(kern, t, t2)

% SIMKERNCOMPUTE Compute the SIM kernel given the parameters and X.
%
%	Description:
%
%	K = SIMKERNCOMPUTE(KERN, T1, T2) computes the kernel parameters for
%	the single input motif kernel given inputs associated with rows and
%	columns.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  T1 - the input matrix associated with the rows of the kernel.
%	  T2 - the input matrix associated with the columns of the kernel.
%
%	K = SIMKERNCOMPUTE(KERN, T) computes the kernel matrix for the
%	single input motif kernel given a design matrix of inputs.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  T - input data matrix in the form of a design matrix.
%	
%
%	See also
%	SIMKERNPARAMINIT, KERNCOMPUTE, KERNCREATE, SIMKERNDIAGCOMPUTE


%	Copyright (c) 2006 Neil D. Lawrence
% 	simKernCompute.m CVS version 1.1
% 	simKernCompute.m SVN version 1
% 	last update 2007-12-19T07:05:33.000000Z

if nargin < 3
  t2 = t;
end
if size(t, 2) > 1 | size(t2, 2) > 1
  error('Input can only have one column');
end

sigma = sqrt(2/kern.inverseWidth);

h = simComputeH(t, t2, kern.decay, kern.decay, kern.delay, kern.delay, sigma);
if nargin < 3
  k = h + h';
else
  h2 = simComputeH(t2, t, kern.decay, kern.decay, kern.delay, kern.delay, sigma);
  k = h + h2';
end
k = 0.5*k*sqrt(pi)*sigma;
k = kern.variance*k;
