function show_database_mnist(vdigit);

% Load MNIST dataset 
nSamples=1000;
[imgs,labels] = load_mnist_dataset(nSamples,vdigit);

maxrow = 4; maxcol = 4;

figure;
for i=1:maxrow*maxcol
  subplot(maxrow,maxcol,i);
  imshow(imgs(:,:,i));
end

  