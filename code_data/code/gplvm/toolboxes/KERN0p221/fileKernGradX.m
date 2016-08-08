function gX = fileKernGradX(kern, X, X2)

% FILEKERNGRADX Gradient of FILE kernel with respect to a point x.
%
%	Description:
%	This command makes no sense for the FILE kernel.
%	
%	
%
%	See also
%	% SEEALSO FILEKERNPARAMINIT, KERNGRADX, FILEKERNDIAGGRADX


%	Copyright (c) 2005, 2006 Neil D. Lawrence
% 	fileKernGradX.m CVS version 1.2
% 	fileKernGradX.m SVN version 1
% 	last update 2007-12-19T07:05:34.000000Z


gX = zeros(size(X2, 1), size(X2, 2), size(X, 1));
