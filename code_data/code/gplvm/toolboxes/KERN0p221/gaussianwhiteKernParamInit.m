function kern = gaussianwhiteKernParamInit(kern)

% GAUSSIANWHITEKERNPARAMINIT Gaussian white kernel parameter initialisation.
%
%	Description:
%	The gaussian white kernel used here corresponds to the covariance of an
%	output function which has been obtained like the output of the
%	convolution operation between a smoothing kernel function T, which follows a
%	a Gaussian form and white noise with variance s^2_r. It is given as
%	
%	k(x_i, x_j) = s^2_r \int T(x_i - z)T(x_j - z) dz
%	= s^2_r N(x_i;x_j, 2L_r^{-1})
%	
%	where L_r is the inverse width in each direction.
%	
%
%	KERN = GAUSSIANWHITEKERNPARAMINIT(KERN) initialises the gaussian
%	white kernel structure with some default parameters.
%	 Returns:
%	  KERN - the kernel structure with the default parameters placed in.
%	 Arguments:
%	  KERN - the kernel structure which requires initialisation.
%	
%	
%
%	See also
%	KERNCREATE, KERNPARAMINIT


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence
% 	gaussianwhiteKernParamInit.m SVN version 285
% 	last update 2009-03-04T20:53:50.000000Z
  
kern.sigma2Noise = 1;
kern.precisionT = 100*ones(kern.inputDimension,1);
kern.nParams = kern.inputDimension + 1;
% Constrains parameters positive for optimisation.
% The variances of P need to be positive and we constrain the sensitivity
% to be positive as well
kern.transforms.index =1:kern.nParams;
kern.transforms.type = optimiDefaultConstraint('positive');
kern.isStationary = true;