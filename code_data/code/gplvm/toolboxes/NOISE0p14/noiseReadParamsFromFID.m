function noise = noiseReadParamsFromFID(type, FID)

% NOISEREADPARAMSFROMFID Read the noise parameters from C++ file FID.
%
%	Description:
%
%	NOISE = NOISEREADPARAMSFROMFID(TYPE, FID) reads noise parameters
%	from a C++ file stream and returns them in the appropriate noise
%	structure.
%	 Returns:
%	  NOISE - the noise structure containing the parameters.
%	 Arguments:
%	  TYPE - the type of noise structure that is being read.
%	  FID - the file ID of the stream that is being read.
%	
%
%	See also
%	IVMREADFROMFID


%	Copyright (c) 2005 Neil D. Lawrence
% 	noiseReadParamsFromFID.m version 1.3



noise = noiseCreate(type);
lineStr = getline(FID);
tokens = tokenise(lineStr, '=');
if(length(tokens)~=2 | ~strcmp(tokens{1}, 'numParams'))
  error('Incorrect file format.')
end
noise.nParams = str2num(tokens{2});
  
lineStr = getline(FID);
tokens = tokenise(lineStr, '=');
if(length(tokens)~=2 | ~strcmp(tokens{1}, 'numProcesses'))
  error('Incorrect file format.')
end
noise.numProcess = str2num(tokens{2});

if strcmp(type, 'ncnm') 
  lineStr = getline(FID);
  tokens = tokenise(lineStr, '=');
  if(length(tokens)~=2 | ~strcmp(tokens{1}, 'gammaSplit'))
    error('Incorrect file format.')
  end
  noise.gammaSplit = str2num(tokens{2});
end
noise = noiseParamInit(noise);
  
lineStr = getline(FID);
tokens = tokenise(lineStr);
params = zeros(1, noise.nParams);
for j=1:noise.nParams
  params(1, j) = str2num(tokens{j});
end
fhandle = str2func([noise.type 'NoiseExpandParam']);
noise = fhandle(noise, params);
