function [params, names] = gaussianwhiteKernExtractParam(kern)

% GAUSSIANWHITEKERNEXTRACTPARAM Extract parameters from the gaussian white
%
%	Description:
%	kernel structure.
%
%	PARAM = GAUSSIANWHITEKERNEXTRACTPARAM(KERN) extracts parameters from
%	the gaussian white kernel structure into a vector of parameters for
%	optimisation.
%	 Returns:
%	  PARAM - vector of parameters extracted from the kernel. If the
%	   field 'transforms' is not empty in the kernel matrix, the
%	   parameters will be transformed before optimisation (for example
%	   positive only parameters could be logged before being returned).
%	 Arguments:
%	  KERN - the kernel structure containing the parameters to be
%	   extracted.
%	DESC extracts parameters and
%	parameter names from the gaussian white kernel structure.
%	RETURN param :vector of parameters extracted from the kernel. If the
%	field 'transforms' is not empty in the kernel matrix, the
%	parameters will be transformed before optimisation (for example
%	positive only parameters could be logged before being returned).
%	RETURN names : cell array of strings giving names to the parameters.
%	ARG kern : the kernel structure containing the parameters to be
%	extracted.
%	
%	kernExtractParam, scg, conjgrad
%	
%
%	See also
%	GAUSSIANWHITEKERNPARAMINIT, GAUSSIANWHITEKERNEXPANDPARAM, 


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence
% 	gaussianwhiteKernExtractParam.m SVN version 285
% 	last update 2009-03-04T20:53:50.000000Z

params = kern.precisionT';
params(end+1) = kern.sigma2Noise;
if nargout > 1
    unames = cell(size(kern.precisionT,1),1);
    for i=1:size(kern.precisionT,1),
        unames{i}=['inverse width latent (' num2str(i) ',' num2str(i) ')'];
    end
    names = unames(:)';
    names = {names{:}, 'variance latent'};
end