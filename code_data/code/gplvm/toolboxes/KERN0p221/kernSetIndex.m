function kern = kernSetIndex(kern, component, indices)

% KERNSETINDEX Set the indices on a compound kernel.
%
%	Description:
%	kern = kernSetIndex(kern, component, indices)
%% 	kernSetIndex.m CVS version 1.1
% 	kernSetIndex.m SVN version 1
% 	last update 2007-12-19T07:05:34.000000Z

fhandle = [kern.type 'KernSetIndex'];
if exist(fhandle)==2
  fhandle = str2func(fhandle);
  kern = fhandle(kern, component, indices);
else
  warning(['Setting of indices not possible for ' kern.type ' kernels.']);
end
