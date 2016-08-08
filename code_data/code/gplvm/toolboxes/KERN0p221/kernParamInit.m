function kern = kernParamInit(kern)

% KERNPARAMINIT Kernel parameter initialisation.
%
%	Description:
%
%	KERN = KERNPARAMINIT(KERN) initialises the parameters of a kernel.
%	 Returns:
%	  KERN - the kernel structure with the parameters initialised.
%	 Arguments:
%	  KERN - the kernel structure for which the parameters will be
%	   initialised.
%
%	See also
%	KERNCREATE
% 	kernParamInit.m CVS version 1.5
% 	kernParamInit.m SVN version 1
% 	last update 2007-12-19T07:05:34.000000Z

fhandle = str2func([kern.type 'KernParamInit']);
% By default don't transform kernel parameters.
kern.transforms = [];
kern = fhandle(kern);
