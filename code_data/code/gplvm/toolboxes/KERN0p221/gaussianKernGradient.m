function g = gaussianKernGradient(kern, x, varargin)

% GAUSSIANKERNGRADIENT Gradient of gaussian kernel's parameters.
%
%	Description:
%
%	G = GAUSSIANKERNGRADIENT(KERN, X, PARTIAL) computes the gradient of
%	functions with respect to the gaussian kernel's parameters. As well
%	as the kernel structure and the input positions, the user provides a
%	matrix PARTIAL which gives the partial derivatives of the function
%	with respect to the relevant elements of the kernel matrix.
%	 Returns:
%	  G - gradients of the function of interest with respect to the
%	   kernel parameters. The ordering of the vector should match that
%	   provided by the function kernExtractParam.
%	 Arguments:
%	  KERN - the kernel structure for which the gradients are being
%	   computed.
%	  X - the input locations for which the gradients are being
%	   computed.
%	  PARTIAL - matrix of partial derivatives of the function of
%	   interest with respect to the kernel matrix. The argument takes the
%	   form of a square matrix of dimension  numData, where numData is
%	   the number of rows in X.
%
%	G = GAUSSIANKERNGRADIENT(KERN, X1, X2, PARTIAL) computes the
%	derivatives as above, but input locations are now provided in two
%	matrices associated with rows and columns of the kernel matrix.
%	 Returns:
%	  G - gradients of the function of interest with respect to the
%	   kernel parameters.
%	 Arguments:
%	  KERN - the kernel structure for which the gradients are being
%	   computed.
%	  X1 - the input locations associated with the rows of the kernel
%	   matrix.
%	  X2 - the input locations associated with the columns of the kernel
%	   matrix.
%	  PARTIAL - matrix of partial derivatives of the function of
%	   interest with respect to the kernel matrix. The matrix should have
%	   the same number of rows as X1 and the same number of columns as X2
%	   has rows.
%	gaussianKernDiagGradient, kernGradX
%	
%
%	See also
%	GAUSSIANKERNPARAMINIT, KERNGRADIENT, 


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence
% 	gaussianKernGradient.m SVN version 20
% 	last update 2008-06-06T19:57:23.000000Z
  
if nargin < 4
    k  = gaussianKernCompute(kern, x);
    x2 = x;
    covPar = varargin{1};
else
    k = gaussian2KernCompute(kern, x, varargin{1});
    x2 = varargin{1};
    covPar = varargin{2};
end

matGrad = zeros(kern.inputDimension,1); 

for i = 1:kern.inputDimension,
    X = repmat(x(:,i),1, size(x2,1));
    X2 = repmat(x2(:,i)',size(x,1),1);
    matGrad(i) = -sum(sum(0.5*covPar.*k.*(X - X2).*(X - X2)));
end

g = [matGrad' sum(sum(covPar.*k))];




