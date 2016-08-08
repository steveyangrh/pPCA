function kern = gaussianwhiteKernExpandParam(kern, params)

% GAUSSIANWHITEKERNEXPANDPARAM Create kernel structure from gaussian white
%
%	Description:
%	kernel's parameters.
%
%	KERN = GAUSSIANWHITEKERNEXPANDPARAM(KERN, PARAM) returns a gaussian
%	white kernel structure filled with the parameters in the given
%	vector. This is used as a helper function to enable parameters to be
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
%	GAUSSIANWHITEKERNPARAMINIT, GAUSSIANWHITEKERNEXTRACTPARAM, KERNEXPANDPARAM


%	Copyright (c) 2008 Mauricio Alvarez and Neil D. Lawrence
% 	gaussianwhiteKernExpandParam.m SVN version 285
% 	last update 2009-03-04T20:53:50.000000Z
  
kern.sigma2Noise = params(end);
kern.precisionT =  params(1:end-1)';