function var = kernGetVariance(kern)

% KERNGETVARIANCE Get the signal associated with a the kernel.
%
%	Description:
%	var = kernGetVariance(kern)
%% 	kernGetVariance.m CVS version 1.1
% 	kernGetVariance.m SVN version 1
% 	last update 2007-12-19T07:05:34.000000Z

fhandleStr = ([kern.type 'KernGetVariance']);
if exist(fhandleStr)==2
  fhandle = str2func(fhandleStr);
  var = fhandle(kern);
  return
else
  if(strcmp(kern.type, 'white'))
    var = 0;
    return
  else
    if(isfield(kern, 'variance'))
      var = kern.variance;
    else
      error(['No field variance or file ' fhandleStr])
    end
    return
  end
end
