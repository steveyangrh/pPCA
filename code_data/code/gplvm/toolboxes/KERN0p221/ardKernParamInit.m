function kern = ardKernParamInit(kern)

% ARDKERNPARAMINIT ARD kernel parameter initialisation.
%
%	Description:
%	This kernel is a 'pre-packaged' compound kernel of the form
%	{'rbfard', 'linard', 'bias', 'white'}. The input scales are shared
%	between the linear and RBF ARD kernels. Using this kernel removes
%	the overhead of mutliple calls through the 'cmpnd' kernel.
%	
%	
%
%	KERN = ARDKERNPARAMINIT(KERN) initialises the pre-built RBF and
%	linear ARD kernel structure with some default parameters.
%	 Returns:
%	  KERN - the kernel structure with the default parameters placed in.
%	 Arguments:
%	  KERN - the kernel structure which requires initialisation.
%	
%
%	See also
%	% SEEALSO SQEXPKERNPARAMINIT, KERNCREATE, KERNPARAMINIT


%	Copyright (c) 2004 Neil D. Lawrence
% 	ardKernParamInit.m CVS version 1.6
% 	ardKernParamInit.m SVN version 1
% 	last update 2007-12-19T07:05:35.000000Z


scales = diag(sqrt(kern.inputScales));
x = x*scales;
    
if nargin < 3
  n2 = dist2(x, x);
  wi2 = (.5 .* kern.inverseWidth);
  rbfPart = kern.rbfVariance*exp(-n2*wi2);
  linearPart = x*x'*kern.linearVariance;
  k = rbfPart + kern.whiteVariance*eye(size(x, 1)) + linearPart;
else
  x2 = x2*scales;
  n2 = dist2(x, x2);
  wi2 = (.5 .* kern.inverseWidth);
  rbfPart = kern.rbfVariance*exp(-n2*wi2);
  linearPart = x*x2'*kern.linearVariance;
  k = rbfPart + linearPart;
end
k = k + kern.biasVariance;


scales = diag(sqrt(kern.inputScales));
x = x*scales;
    
if nargin < 3
  n2 = dist2(x, x);
  wi2 = (.5 .* kern.inverseWidth);
  rbfPart = kern.rbfVariance*exp(-n2*wi2);
  linearPart = x*x'*kern.linearVariance;
  k = rbfPart + kern.whiteVariance*eye(size(x, 1)) + linearPart;
else
  x2 = x2*scales;
  n2 = dist2(x, x2);
  wi2 = (.5 .* kern.inverseWidth);
  rbfPart = kern.rbfVariance*exp(-n2*wi2);
  linearPart = x*x2'*kern.linearVariance;
  k = rbfPart + linearPart;
end
k = k + kern.biasVariance;

kern.inverseWidth = 1;
kern.rbfVariance = 1;
kern.whiteVariance = 1; 
kern.biasVariance = 1;
kern.linearVariance = 1;
kern.inputScales = 0.999*ones(1, kern.inputDimension);
kern.nParams = 5 + kern.inputDimension;

kern.transforms(1).index = [1 2 3 4 5];
kern.transforms(1).type = optimiDefaultConstraint('positive');
kern.transforms(2).index = [6:kern.nParams];
kern.transforms(2).type = optimiDefaultConstraint('zeroone');

kern.isStationary = false;