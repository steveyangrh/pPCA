function gX = ggXgaussianKernGradX(ggKern, gaussianKern, X, X2)

% GGXGAUSSIANKERNGRADX Compute gradient between the GG and GAUSSIAN
%
%	Description:
%	kernels wrt the input locations
%
%	G = GGXGAUSSIANKERNGRADX(KERN, X1, X2) computes the gradient between
%	the GG and GAUSSIAN kernels with respect to the input positions
%	where both the row positions and column positions are provided
%	separately.
%	 Returns:
%	  G - the returned gradients. The gradients are returned in a matrix
%	   which is numData2 x numInputs x numData1. Where numData1 is the
%	   number of data points in X1, numData2 is the number of data points
%	   in X2 and numInputs is the number of input dimensions in X.
%	 Arguments:
%	  KERN - kernel structure for which gradients are being computed.
%	  X1 - row locations against which gradients are being computed.
%	  X2 - column locations against which gradients are being computed.
%	
%
%	See also
%	GAUSSIANKERNPARAMINIT, KERNGRADX, GAUSSIANKERNDIAGGRADX


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence
% 	ggXgaussianKernGradX.m SVN version 200
% 	last update 2009-01-22T20:53:32.000000Z

if nargin < 3,    
    X2 = X;
else
    U = X;
    X = X2;
    X2 = U;
end

[K, Linv] = ggXgaussianKernCompute(ggKern, gaussianKern, X2, X);
Pinv = Linv.^2;
X2 = (X2- repmat(ggKern.translation',size(X2,1),1));
PinvX = X*diag(Pinv);
PinvX2 = X2*diag(Pinv);

gX = zeros(size(X2, 1), size(X2, 2), size(X, 1));
for i = 1:size(X, 1);
  gX(:, :, i) = gaussianKernGradXpoint(K(:,i), PinvX(i, :), PinvX2);
end

% gXu = zeros(size(X));
% 
% for i = 1:size(X,1),
%     for j=1:size(X,2),
%       gXu(i,j) = covGrad(i,:)*gX(:,j,i);
%     end
% end

function gX = gaussianKernGradXpoint(gaussianPart, x, X2)

% GAUSSIANKERNGRADXPOINT Gradient with respect to one point of x.

gX = zeros(size(X2));
for i = 1:size(x, 2)
  gX(:, i) = (X2(:, i) - x(i)).*gaussianPart;
end

