function kern = ggKernExpandParam(kern, params)

% GGKERNEXPANDPARAM Create kernel structure from GG kernel's parameters.
%
%	Description:
%
%	KERN = GGKERNEXPANDPARAM(KERN, PARAM) returns a gaussian gaussian
%	kernel structure filled with the parameters in the given vector.
%	This is used as a helper function to enable parameters to be
%	optimised in, for example, the NETLAB optimisation functions.
%	 Returns:
%	  KERN - kernel structure with the given parameters in the relevant
%	   locations.
%	 Arguments:
%	  KERN - the kernel structure in which the parameters are to be
%	   placed.
%	  PARAM - vector of parameters which are to be placed in the kernel
%	   structure.
%	
%
%	See also
%	GGKERNPARAMINIT, GGKERNEXTRACTPARAM, KERNEXPANDPARAM


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence
% 	ggKernExpandParam.m SVN version 1
% 	last update 2008-05-30T23:26:31.000000Z


covG = params(1:end-2-kern.inputDimension);

startOne = 1;
endOne =kern.inputDimension;
kern.precision_u = covG(:,startOne:endOne)';
startOne = startOne + kern.inputDimension;
endOne = endOne + kern.inputDimension;
kern.precision_y = covG(:,startOne:endOne)';
kern.sigma2_u = params(end-kern.inputDimension-1);
kern.sigma2_y = params(end-kern.inputDimension);
kern.translation = params(end-kern.inputDimension+1:end)';
