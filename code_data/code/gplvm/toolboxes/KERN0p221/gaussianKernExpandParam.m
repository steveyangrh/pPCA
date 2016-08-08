function kern = gaussianKernExpandParam(kern, params)

% GAUSSIANKERNEXPANDPARAM Create kernel structure from gaussian kernel's parameters.
%
%	Description:
%
%	KERN = GAUSSIANKERNEXPANDPARAM(KERN, PARAM) returns a gaussian
%	kernel structure filled with the parameters in the given vector.
%	This is used as a helper function to enable parameters to be
%	optimised in, for example, the NETLAB optimisation functions.
%	 Returns:
%	  KERN - kernel structure with the given parameters in the relevant
%	   locations.
%	 Arguments:
%	  KERN - the kernel structure in which the parameters are to be
%	  PARAM - vector of parameters which are to be placed in the kernel
%	   structure.
%	
%
%	See also
%	GAUSSIANKERNPARAMINIT, GAUSSIANKERNEXTRACTPARAM, KERNEXPANDPARAM


%	Copyright (c) 2008 Mauricio Alvarez and Neil D. Lawrence
% 	gaussianKernExpandParam.m SVN version 1
% 	last update 2008-05-30T23:26:31.000000Z
  
kern.sigma2_u = params(end);
kern.precision_u =  params(1:end-1)';