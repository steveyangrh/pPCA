function gX = noneKernGradX(kern, x, x2)

% NONEKERNGRADX Gradient of NONE kernel with respect to a point x.
%
%	Description:
%
%	G = NONEKERNGRADX(KERN, X) computes the gradient of the dummy kernel
%	function kernel with respect to the input positions.
%	 Returns:
%	  G - the returned gradients. The gradients are returned in a matrix
%	   which is numData x numInputs x numData. Where numData is the
%	   number of data points and numInputs is the number of input
%	   dimensions in X.
%	 Arguments:
%	  KERN - kernel structure for which gradients are being computed.
%	  X - locations against which gradients are being computed.
%
%	G = NONEKERNGRADX(KERN, X1, X2) computes the gradident of the dummy
%	kernel function kernel with respect to the input positions where
%	both the row positions and column positions are provided separately.
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
%	% SEEALSO NONEKERNPARAMINIT, KERNGRADX, NONEKERNDIAGGRADX


%	Copyright (c) 2008 Neil D. Lawrence
% 	noneKernGradX.m SVN version 151
% 	last update 2008-11-03T20:01:56.000000Z

gX = zeros(size(X2, 1), size(X2, 2), size(X, 1));
