
% DEMBRENDAN3 Model the face data with a 2-D GPLVM.
%
%	Description:
%	% 	demBrendan3.m CVS version 1.6
% 	demBrendan3.m SVN version 29
% 	last update 2008-01-24T09:56:49.000000Z

% Fix seeds
randn('seed', 1e5);
rand('seed', 1e5);

display = 0;

dataSetName = 'brendan';
experimentNo = 3;

% load data
[Y, lbls] = lvmLoadData(dataSetName);

% Set IVM active set size and iteration numbers.
options = gplvmOptions;
numActive = 100;

% Fit the GP latent variable model
noiseType = 'gaussian';
selectionCriterion = 'entropy';
kernelType = {'mlp', 'bias', 'white'};
model = gplvmFit(Y, 2, options, kernelType, noiseType, selectionCriterion, numActive, lbls);

% Save the results.
[X, kern, noise, ivmInfo] = gplvmDeconstruct(model);
capName = dataSetName;
capName(1) = upper(capName(1));
save(['dem' capName num2str(experimentNo) '.mat'], 'X', 'kern', 'noise', 'ivmInfo');

% Load the results and display dynamically.
gplvmResultsDynamic(dataSetName, experimentNo, 'image', [20 28], 1, 0, 1)

% Load the results and display statically.
% gplvmResultsStatic(dataSetName, experimentNo, 'image', [20 28], 1, 0, 1)

% Load the results and display as scatter plot
% gplvmResultsStatic(dataSetName, experimentNo, 'none')
