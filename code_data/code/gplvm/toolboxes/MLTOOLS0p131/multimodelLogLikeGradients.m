function g = multimodelLogLikeGradients(model)

% MULTIMODELLOGLIKEGRADIENTS Gradient of MULTIMODEL model log likelihood with respect to parameters.
%
%	Description:
%
%	G = MULTIMODELLOGLIKEGRADIENTS(MODEL) computes the gradient of the
%	multi-task learning wrapper model's log likelihood with respect to
%	the parameters.
%	 Returns:
%	  G - the returned gradients.
%	 Arguments:
%	  MODEL - model structure for which gradients are being computed.
%	
%	
%
%	See also
%	% SEEALSO MULTIMODELCREATE, MULTIMODELLOGLIKELIHOOD, MODELLOGLIKEGRADIENTS


%	Copyright (c) 2007, 2008 Neil D. Lawrence


%	With modifications by Mauricio Alvarez 2009
% 	multimodelLogLikeGradients.m CVS version 1.1
% 	multimodelLogLikeGradients.m SVN version 298
% 	last update 2009-04-08T10:40:14.000000Z

  g = zeros(1, model.numParams);
  endShared = model.numParams - model.numModels*model.numSep;
  endVal = endShared; 
  for i = 1:length(model.comp)
    gModel = modelLogLikeGradients(model.comp{i}); 
    g(1:endShared) = g(1:endShared) + gModel(model.sharedIndices);
    if ~isempty(model.separateIndices)
      startVal = endVal + 1;
      endVal = endVal + model.numSep;
      %g(startVal:endVal) = g(model.separateIndices);
      g(startVal:endVal) = gModel(model.separateIndices);      
    end
  end
end
