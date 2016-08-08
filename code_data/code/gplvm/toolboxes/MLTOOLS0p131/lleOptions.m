function options = lleOptions(neighbours, latentDim)

% LLEOPTIONS Options for a density network.
%
%	Description:
%
%	OPTIONS = LLEOPTIONS returns the default options for a locally
%	linear embedding.
%	 Returns:
%	  OPTIONS - default options structure for locally linear embedding.
%	
%
%	See also
%	LLECREATE, MLPCREATE, RBFCREATE, KBRCREATE


%	Copyright (c) 2008 Neil D. Lawrence
% 	lleOptions.m SVN version 99
% 	last update 2008-10-05T23:06:01.000000Z

if nargin < 2
  latentDim = 2
  if nargin < 1
    neighbours = 7;
  end
end
options.latentDim = latentDim;
options.numNeighbours = neighbours;


