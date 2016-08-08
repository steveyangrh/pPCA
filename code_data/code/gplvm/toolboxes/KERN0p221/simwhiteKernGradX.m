function gT = simwhiteKernGradX(kern, t1, t2)

% SIMWHITEKERNGRADX Gradient of SIM-WHITE kernel with respect to a point t.
%
%	Description:
%
%	GT = SIMWHITEKERNGRADX(KERN, T1) computes the gradient of the
%	SIM-White (Single Input Motif - White) kernel with respect to the
%	input positions.
%	 Returns:
%	  GT - the returned gradients. The gradients are returned in a
%	   matrix which is numData x numInputs x numData. Where numData is
%	   the number of data points and numInputs is the number of input
%	   dimensions in t1 (currently always one).
%	 Arguments:
%	  KERN - kernel structure for which gradients are being computed.
%	  T1 - locations against which gradients are being computed.
%
%	GT = SIMWHITEKERNGRADX(KERN, T1, T2) computes the gradident of the
%	SIM-White (Single Input Motif - White) kernel with respect to the
%	input positions where both the row positions and column positions
%	are provided separately.
%	 Returns:
%	  GT - the returned gradients. The gradients are returned in a
%	   matrix which is numData2 x numInputs x numData1. Where numData1 is
%	   the number of data points in t1, numData2 is the number of data
%	   points in t2 and numInputs is the number of input dimensions in t1
%	   (currently always one).
%	 Arguments:
%	  KERN - kernel structure for which gradients are being computed.
%	  T1 - row locations against which gradients are being computed.
%	  T2 - column locations against which gradients are being computed.
%	
%
%	See also
%	% SEEALSO SIMWHITEKERNPARAMINIT, KERNGRADX, SIMWHITEKERNDIAGGRADX


%	Copyright (c) 2009 David Luengo
% 	simwhiteKernGradX.m SVN version 198
% 	last update 2009-01-22T20:53:32.000000Z


error('simwhiteKernGradX not yet implemented.')