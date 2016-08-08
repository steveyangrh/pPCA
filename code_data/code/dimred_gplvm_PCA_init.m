function dimred_gplvm_PCA_init();
% Dimensionality reduction with PCA
% Function checks if the file with the results exists

% Set parameters
[nSamples,digitsList] = set_params;

% Add paths
add_toolboxes();

% Load database
[imgs,labels] = load_mnist_dataset(nSamples,digitsList);
data = dataformat_mnist_gplvm(imgs);

% Save results .m
fileName=set_fileName(digitsList,nSamples);

%DIMENSIONALITY REDUCTION(2 dimentions)
if ~exist(fileName)
  data_red = gplvmPcaInit(data, 2);
  X = data_red(:,1); Y = data_red(:,2);

  save(fileName,'imgs','labels','X','Y','nSamples','digitsList');
else
  load(fileName);
end

% Visualize 
draw_data(X,Y,labels,imgs);



%%%%%%%%
function fileName=set_fileName(digitsList,nSamples)

digstr=[];
for i=1:length(digitsList)
  digstr=[digstr,num2str(digitsList(i))];
end
fileName = ['./results/dimred_gplvm_PCA_init_nS',num2str(nSamples),'_',digstr,'.mat'];



