function g = linearOutputGrad(model, X)

% LINEAROUTPUTGRAD Evaluate derivatives of linear model outputs with respect to parameters.
%
%	Description:
%	g = linearOutputGrad(model, X)
%% 	linearOutputGrad.m CVS version 1.3
% 	linearOutputGrad.m SVN version 24
% 	last update 2007-11-03T14:24:26.000000Z

numData = size(X, 1);
for i = 1:model.outputDim
  startZeros = zeros(numData, model.inputDim*(i - 1));
  finishZeros = zeros(numData, model.inputDim*(model.outputDim-i));
  startZeros2 = zeros(numData, (i - 1));
  finishZeros2 = zeros(numData, (model.outputDim-i));
  g(:, :, i) = [startZeros X finishZeros startZeros2 ones(numData, 1) finishZeros2];
end