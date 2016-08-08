function kern = ggKernParamInit(kern)

% GGKERNPARAMINIT GG kernel parameter initialisation.
%
%	Description:
%
%	GGKERNPARAMINIT
%	y_n(x) =  sum_k int K_{nk}(x-s)u_k(s)ds
%	
%	where K_{nk}(x-s) is a Gaussian kernel with precision matrix precision_y,
%	and u_k(s) is an inducing function represented as a Gaussian process with
%	inverse covariance precision_u.  With this assumptions, y_n(x) is also a
%	Gaussian process with covariance provided by the Gaussian Gaussian kernel.
%	
%	The kernel is designed to interoperate with the multiple output block
%	kernel so that u_k(s) can be inferred given several different
%	instantiations of y_n(x).
%	
%	Both precision_y and precision_u are considered as diagonal.
%	
%	DESC initialises the Gaussian Gaussian kernel structure with some default parameters.
%	RETURN kern : the kernel structure with the default parameters placed in.
%	ARG kern : the kernel structure which requires initialisation.
%	
%	
%
%	See also
%	KERNCREATE, KERNPARAMINIT, GGKERNCOMPUTE


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence
% 	ggKernParamInit.m SVN version 316
% 	last update 2009-03-04T19:33:51.000000Z

kern.sigma2_u = 1;
kern.sigma2_y = 1;
kern.precision_u = 100*ones(kern.inputDimension,1);
kern.precision_y = 100*ones(kern.inputDimension,1);
kern.translation = ones(kern.inputDimension,1); 

kern.nParams =2*kern.inputDimension + 2 + kern.inputDimension;

% The variances must be positive. As well as the sensitivity of the latent
% function.
kern.transforms.index = 1:(2*kern.inputDimension+1);
kern.transforms.type = optimiDefaultConstraint('positive');
kern.isStationary = true;