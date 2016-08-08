function [imgs,labels] = load_mnist_dataset(nSamples,digitsList)

imgFile='../data/mnist/train-images-idx3-ubyte';
labelFile='../data/mnist/train-labels-idx1-ubyte';
offsetSample=0;

[imgs_all labels_all] = readMNIST(imgFile, labelFile, nSamples, offsetSample);
imgs_all = ones(size(imgs_all))-imgs_all;

% Pick up digits
assert(length(digitsList) < 8); % 7 is a maxiumum number of colors in gscatter

imgs=[]; labels=[]; j=1;
for i=1:nSamples
  
  if ~isempty(find(digitsList == labels_all(i))) % exists on the list
    imgs(:,:,j) = imgs_all(:,:,i);
    labels(j) = labels_all(i);
    j=j+1;
  end
end