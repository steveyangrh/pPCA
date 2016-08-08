function [params, names] = ggKernExtractParam(kern)

% GGKERNEXTRACTPARAM Extract parameters from the GG kernel structure.
%
%	Description:
%
%	PARAM = GGKERNEXTRACTPARAM(KERN) Extract parameters from the
%	gaussian gaussian kernel structure into a vector of parameters for
%	optimisation.
%	 Returns:
%	  PARAM - vector of parameters extracted from the kernel. If the
%	   field 'transforms' is not empty in the kernel matrix, the
%	   parameters will be transformed before optimisation (for example
%	   positive only parameters could be logged before being returned).
%	 Arguments:
%	  KERN - the kernel structure containing the parameters to be
%	   extracted.
%
%	[PARAM, NAMES] = GGKERNEXTRACTPARAM(KERN) extract parameters and
%	their names from the gaussian gaussian kernel structure.
%	 Returns:
%	  PARAM - vector of parameters extracted from the kernel. If the
%	   field 'transforms' is not empty in the kernel matrix, the
%	   parameters will be transformed before optimisation (for example
%	   positive only parameters could be logged before being returned).
%	  NAMES - cell array of strings containing parameter names.
%	 Arguments:
%	  KERN - the kernel structure containing the parameters to be
%	   extracted.
%	conjgrad
%	
%
%	See also
%	GGKERNPARAMINIT, GGKERNEXPANDPARAM, KERNEXTRACTPARAM, SCG, 


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence
% 	ggKernExtractParam.m SVN version 200
% 	last update 2009-01-22T20:53:32.000000Z

params = [kern.precision_u' kern.precision_y' kern.sigma2_u kern.sigma2_y kern.translation'];

if nargout > 1
    unames = cell(1,kern.inputDimension);
    ynames = cell(1,kern.inputDimension);
    mu_names = cell(1,kern.inputDimension);
    for i=1:kern.inputDimension,
        unames{i}=['inverse width latent (' num2str(i) ',' num2str(i) ')'];
        ynames{i}=['inverse width output (' num2str(i) ',' num2str(i) ')'];
        mu_names{i}=['mean (' num2str(i) ')'];
    end    
    names = {unames{:}, ynames{:}, 'variance latent', 'variance output' , mu_names{:}};
end