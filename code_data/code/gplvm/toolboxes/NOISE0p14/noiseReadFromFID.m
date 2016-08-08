function noise = noiseReadFromFID(FID)

% NOISEREADFROMFID Load from an FID written by the C++ implementation.
%
%	Description:
%
%	NOISEREADFROMFID(FID, NOISE) reads a noise structure from a file
%	stream created by the C++ implementation of the noises.
%	 Arguments:
%	  FID - the file stream ID.
%	  NOISE - the noise structure created.
%	
%
%	See also
%	NOISECREATE, NOISEREADPARAMSFROMFID


%	Copyright (c) 2005 Neil D. Lawrence
% 	noiseReadFromFID.m version 1.2


lineStr = getline(FID);
tokens = tokenise(lineStr, '=');
if(length(tokens)~=2 | ~strcmp(tokens{1}, 'noiseVersion'))
  error('Incorrect file format.')
end
if(~strcmp(tokens{2}, '0.1'))
  error('Incorrect file version.')
end

lineStr = getline(FID);
tokens = tokenise(lineStr, '=');
if(length(tokens)~=2 | ~strcmp(tokens{1}, 'type'))
  error('Incorrect file format.')
end
type = tokens{2};
noise = noiseReadParamsFromFID(type, FID);

