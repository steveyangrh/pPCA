function model = lleCreate(inputDim, outputDim, Y, options)

% LLECREATE Locally linear embedding model.
%
%	Description:
%
%	MODEL = LLECREATE(INPUTDIMENSION, OUTPUTDIM, Y, OPTIONS) creates a
%	structure for a locally linear embedding.
%	 Returns:
%	  MODEL - model structure containing the neural network specified.
%	 Arguments:
%	  INPUTDIMENSION - dimension of latent space.
%	  OUTPUTDIM - dimension of data.
%	  Y - the data to be modelled in design matrix format (as many rows
%	   as there are data points).
%	  OPTIONS - options structure as returned by lleCreate.
%	
%
%	See also
%	LLEOPTIONS, MODELCREATE


%	Copyright (c) 2008 Neil D. Lawrence
% 	lleCreate.m SVN version 98
% 	last update 2008-08-06T18:34:16.000000Z


model.type = 'lle';

if size(Y, 2) ~= outputDim
  error(['Input matrix Y does not have dimension ' num2str(d)]);
end
model.k = options.numNeighbours;
model.Y = Y;
model.d = outputDim;
model.q = options.latentDim;
model.N = size(Y, 1);