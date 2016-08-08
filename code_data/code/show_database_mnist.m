function show_database_mnist();

%  close all;
figure; hold on
maxrow = 1; maxcol = 7; % per one digit

% Set parameters
[nSamples,digitsList] = set_params();

ndig=length(digitsList);

j=1;
for vdigit=digitsList

  % Load MNIST dataset 
  [imgs,labels] = load_mnist_dataset(nSamples,vdigit);

  for i=1:maxrow*maxcol 
    subplot(maxrow*ndig,maxcol,i+maxcol*(j-1));
    imshow(imgs(:,:,i+3)); %+3 - more interesting data
  end
  
  j=j+1;
end

