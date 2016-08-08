function kern = linKernExpandParam(kern, params)

% LINKERNEXPANDPARAM Create kernel structure from LIN kernel's parameters.
%
%	Description:
%
%	KERN = LINKERNEXPANDPARAM(KERN, PARAM) returns a linear kernel
%	structure filled with the parameters in the given vector. This is
%	used as a helper function to enable parameters to be optimised in,
%	for example, the NETLAB optimisation functions.
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
%	LINKERNPARAMINIT, LINKERNEXTRACTPARAM, KERNEXPANDPARAM


%	Copyright (c) 2004, 2005, 2006 Neil D. Lawrence
% 	linKernExpandParam.m CVS version 1.4
% 	linKernExpandParam.m SVN version 1
% 	last update 2007-12-19T07:05:34.000000Z


kern.variance = params(1);
