function [params, names] = gaussianKernExtractParam(kern)

% GAUSSIANKERNEXTRACTPARAM Extract parameters from the gaussian kernel structure.
%
%	Description:
%
%	PARAM = GAUSSIANKERNEXTRACTPARAM(KERN) extracts parameters from the
%	gaussian kernel structure into a vector of parameters for
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
%	parameter names from the gaussian kernel structure.
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
%	GAUSSIANKERNPARAMINIT, GAUSSIANKERNEXPANDPARAM, 


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence
% 	gaussianKernExtractParam.m SVN version 200
% 	last update 2009-01-22T20:53:32.000000Z

params = kern.precision_u';
params(end+1) = kern.sigma2_u;
if nargout > 1
    unames = cell(size(kern.precision_u,1),1);
    for i=1:size(kern.precision_u,1),
        unames{i}=['inverse width latent (' num2str(i) ',' num2str(i) ')'];
    end
    names = unames(:)';
    names = {names{:}, 'variance latent'};
end