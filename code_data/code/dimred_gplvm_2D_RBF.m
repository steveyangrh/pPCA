function dimred_gplvm_2D_RBF();
% Dimensionality reduction with 2-D RBF GPLVM
% Function checks if the file with the results exists

% Set parameters
[nSamples,digitsList] = set_params();

% Add paths
add_toolboxes();

% Load database
[imgs,labels] = load_mnist_dataset(nSamples,digitsList);
data = dataformat_mnist_gplvm(imgs);

% DIMENSIONALITY REDUCTION
numActive = 200;

% Save results
fileName=set_fileName(digitsList,nSamples,numActive);

if ~exist(fileName)

  % Set IVM active set size and iteration numbers.
  options = gplvmOptions;

  % Fit the GP latent variable model
  noiseType = 'gaussian';
  selectionCriterion = 'entropy';
  kernelType = {'rbf', 'bias', 'white'};
  model = gplvmFit(data, 2, options, kernelType, noiseType, selectionCriterion, numActive, labels);

  % Results
  [data_red, kern, noise, ivmInfo] = gplvmDeconstruct(model);
  X = data_red(:,1); Y = data_red(:,2);
  
  save(fileName,'imgs','labels','X','Y','nSamples','digitsList');
else
  load(fileName);
end

% Visualize                                                                                                    
draw_data(X,Y,labels,imgs);



%%%%%%%%
function fileName=set_fileName(digitsList,nSamples,numActive)

digstr=[];
for i=1:length(digitsList)
  digstr=[digstr,num2str(digitsList(i))];
end
fileName = ['./results/dimred_gplvm_2D_RBF_nS',num2str(nSamples),'_nA',num2str(numActive),'_',digstr,'.mat'];



