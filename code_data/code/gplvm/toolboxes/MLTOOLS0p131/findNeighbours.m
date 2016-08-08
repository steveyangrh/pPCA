function neighboursInd = findNeighbours(Y, k)

% FINDNEIGHBOURS find the k nearest neighbours for each point in Y.
%
%	Description:
%
%	FINDNEIGHBOURS(Y, K) returns the indices of the k nearest neighbours
%	to each point in the given data matrix Y.
%	 Arguments:
%	  Y - the data in which neighbours need to be found.
%	  K - the number of neighbours that need to be found.
%	
%
%	See also
%	LLECREATE, MVUCREATE, ISOMAPCREATE


%	Copyright (c) 2008 Neil D. Lawrence
% 	findNeighbours.m SVN version 99
% 	last update 2008-10-05T23:06:01.000000Z
  
Y2 = sum(Y.*Y, 2);
D = repmat(Y2', size(Y, 1), 1) + repmat(Y2, 1, size(Y, 1)) - 2*Y*Y';
D(1:size(D, 1)+1:end) = inf;
[void, ind] = sort(D);
neighboursInd = ind(1:k, :)';
