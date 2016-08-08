function kern = ggwhiteKernParamInit(kern)

% GGWHITEKERNPARAMINIT GG WHITE kernel parameter initialisation.
%
%	Description:
%
%	GGWHITEKERNPARAMINIT
%	y_n(x) =  sum_k int G_{nk}(x-s)u_k(s)ds
%	
%	where K_{nk}(x-s) is a Gaussian kernel with precision matrix precisionG,
%	and u_k(s) is an inducing function represented as a white noise process
%	with variance s^2_r With this assumptions, y_n(x) is a Gaussian process
%	with covariance provided by the Gaussian Gaussian white kernel.
% 	ggwhiteKernParamInit.m SVN version 316
% 	last update 2009-03-04T19:31:53.000000Z
% The kernel is designed to interoperate with the multiple output block
% kernel so that u_k(s) can be inferred given several different
% instantiations of y_n(x). precisionG is considered as diagonal.
% 
% DESC initialises the Gaussian Gaussian white kernel structure with some default parameters.
% RETURN kern : the kernel structure with the default parameters placed in.
% ARG kern : the kernel structure which requires initialisation.
%	
% SEEALSO : kernCreate, kernParamInit, ggwhiteKernCompute
%
% COPYRIGHT : Mauricio A. Alvarez and Neil D. Lawrence, 2008


kern.precisionG = ones(kern.inputDimension,1);
kern.sigma2Noise = 1;
kern.variance = 1;

kern.nParams =kern.inputDimension + 2 ;

% The variances must be positive. As well as the sensitivity of the latent
% function.
kern.transforms.index = 1:kern.inputDimension+1;
kern.transforms.type = optimiDefaultConstraint('positive');
kern.isStationary = true;