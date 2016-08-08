function dimred_gplvm_1D_RBF(flag);
% Dimensionality reduction with 2-D RBF GPLVM
% flag - compute model from scretch (1) or pre-load (0)

% Set parameters
[nSamples,digitsList] = set_params();

% Add paths
add_toolboxes();

% Load database
[imgs,labels] = load_mnist_dataset(nSamples,digitsList);
data = dataformat_mnist_gplvm(imgs);

%  m=mean(data,1)

% DIMENSIONALITY REDUCTION
numActive = 10;

digstr=[];
for i=1:length(digitsList)
  digstr=[digstr,num2str(digitsList(i))];
end
fileName = ['dimred_gplvm_1D_RBF_nS',num2str(nSamples),'_nA',num2str(numActive),'_',digstr,'.mat'];

if flag

  options = gplvmOptions;

  % Fit the GP latent variable model
  noiseType = 'gaussian';
  selectionCriterion = 'entropy';
  kernelType = {'rbf', 'bias', 'white'};
  model = gplvmFit(data, 1, options, kernelType, noiseType, selectionCriterion, numActive, labels);
  
  save('1.mat','model');

  % Results
  [data_red, kern, noise, ivmInfo] = gplvmDeconstruct(model);
  X = data_red(:,1); Y = data_red(:,2);

%    % Set IVM active set size and iteration numbers.
%    options = gplvmOptions;
%  
%  
%    % Fit the GP latent variable model
%    noiseType = 'gaussian';
%    selectionCriterion = 'entropy';
%    kernelType = {'rbf', 'bias', 'white'};
%    model = gplvmFit(data, 2, options, kernelType, noiseType, selectionCriterion, numActive, labels);
%  
%    % Results
%    [data_red, kern, noise, ivmInfo] = gplvmDeconstruct(model);
    
  
  save(fileName,'imgs','labels','X','Y','nSamples','digitsList');
else
  load(fileName);
end

% Visualize                                                                                                    
draw_data(X,Y,labels,imgs);



