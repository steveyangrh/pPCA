function K = simwhiteXsimwhiteKernCompute(simKern1, simKern2, t1, t2)

% SIMWHITEXSIMWHITEKERNCOMPUTE Compute a cross kernel between two SIM-WHITE
%
%	Description:
%	kernels.
%
%	K = SIMWHITEXSIMWHITEKERNCOMPUTE(SIMKERN1, SIMKERN2, T1) computes
%	cross kernel terms between two SIM-WHITE kernels for the multiple
%	output kernel.
%	 Returns:
%	  K - block of values from kernel matrix.
%	 Arguments:
%	  SIMKERN1 - the kernel structure associated with the first
%	   SIM-WHITE kernel.
%	  SIMKERN2 - the kernel structure associated with the second
%	   SIM-WHITE kernel.
%	  T1 - inputs for which kernel is to be computed.
%
%	K = SIMWHITEXSIMWHITEKERNCOMPUTE(SIMKERN1, SIMKERN2, T1, T2)
%	computes cross kernel terms between two SIM-WHITE kernels for the
%	multiple output kernel.
%	 Returns:
%	  K - block of values from kernel matrix.
%	 Arguments:
%	  SIMKERN1 - the kernel structure associated with the first
%	   SIM-WHITE kernel.
%	  SIMKERN2 - the kernel structure associated with the second
%	   SIM-WHITE kernel.
%	  T1 - row inputs for which kernel is to be computed.
%	  T2 - column inputs for which kernel is to be computed.
%	
%
%	See also
%	MULTIKERNPARAMINIT, MULTIKERNCOMPUTE, SIMWHITEKERNPARAMINIT


%	Copyright (c) 2009 David Luengo
% 	simwhiteXsimwhiteKernCompute.m SVN version 198
% 	last update 2009-01-22T20:53:32.000000Z

if nargin < 4
  t2 = t1;
end
if size(t1, 2) > 1 | size(t2, 2) > 1
  error('Input can only have one column');
end
if simKern1.variance ~= simKern2.variance
  error('Kernels cannot be cross combined if they have different variances.')
end

c = simKern1.variance*simKern1.sensitivity*simKern2.sensitivity ...
    /(simKern1.decay+simKern2.decay);
T1 = repmat(t1, 1, size(t2, 1));
T2 = repmat(t2.', size(t1, 1), 1);
ind = (T1 < T2); % (T1 <= T2)?
Dv = simKern2.decay.*ind + simKern1.decay.*(~ind);
K = exp(-Dv.*abs(T1-T2));
if ((simKern1.isStationary == false) | (simKern2.isStationary == false))
    K = K - exp(-(simKern1.decay * T1 * double(simKern1.isStationary == false) ...
        + simKern2.decay * T2 * double(simKern2.isStationary == false)));
end
K = c*K;
